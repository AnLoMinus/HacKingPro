import EventEmitter from 'events'
import {join, extname, normalize} from 'path'
import {watch} from 'chokidar'
import BrowserWindow from 'browser-window'
import {showOpenDialog} from 'dialog'
import shell from 'shell'
import mediator from './mediator'
import events from './events'
import Storage from './storage'
import ipc from 'ipc'
import File from '../common/file'

const URL = 'file://' + join(__dirname, '..', 'index.html')
const EXTENSIONS = [
  '.markdown',
  '.mdown',
  '.mkdn',
  '.md',
  '.mkd',
  '.mdwn',
  '.mdtxt',
  '.mdtext',
  '.text'
]

export default class Window extends EventEmitter {

  static add (window) {
    if (!this.windows) this.windows = []
    this.windows.push(window)
  }

  static remove (window) {
    this.windows.splice(this.windows.indexOf(window), 1)
  }

  static closeAllWindows () {
    this.windows.forEach((window) => window.close())
  }

  constructor (path) {
    super()

    Window.add(this)

    this.onFileChanged = this.onFileChanged.bind(this)
    this.onFileReloading = this.onFileReloading.bind(this)
    this.onFindRequested = this.onFindRequested.bind(this)
    this.onToggleDevToolsRequested = this.onToggleDevToolsRequested.bind(this)
    this.onOpenFileRequested = this.onOpenFileRequested.bind(this)
    this.onClose = this.onClose.bind(this)
    this.onResized = this.onResized.bind(this)
    this.onMoved = this.onMoved.bind(this)
    this.onContentsWillNavigate = this.onContentsWillNavigate.bind(this)

    this.storage = new Storage()
    this.storage.get('bounds', (err, bounds) => {
      if (err) {
        bounds = {
          width: 800,
          height: 600
        }
      }
      this.browserWindow = new BrowserWindow(bounds)
      this.browserWindow.webContents.on('did-finish-load', async () => {
        await this.start(path)
        this.render()
      })
      this.browserWindow.webContents.on('will-navigate', this.onContentsWillNavigate)
      this.browserWindow.on('focus', this.onFocus.bind(this))
      this.browserWindow.on('blur', this.onBlur.bind(this))
      this.browserWindow.on('move', this.onMoved)
      this.browserWindow.on('resize', this.onResized)
      this.browserWindow.on('close', this.onClose)
      this.browserWindow.loadUrl(URL)
      this.setTitle()

      mediator.on(events.OPEN_FILE, this.onOpenFileRequested)
      mediator.on(events.TOGGLE_DEVTOOLS, this.onToggleDevToolsRequested)
      mediator.on(events.FIND, this.onFindRequested)
      mediator.on(events.RELOAD, this.onFileReloading)
      ipc.on('file-reloading', this.onFileReloading)
      ipc.on('file-changing', this.onFileChanging.bind(this))
      ipc.on('history-backwarding', this.onHistoryBackwarding.bind(this))
      ipc.on('history-forwarding', this.onHistoryForwarding.bind(this))
    })
  }

  destruct () {
    this.browserWindow.webContents.removeAllListeners()
    this.browserWindow.removeAllListeners()
    mediator.removeListener(events.OPEN_FILE, this.onOpenFileRequested)
    mediator.removeListener(events.TOGGLE_DEVTOOLS, this.onToggleDevToolsRequested)
    mediator.removeListener(events.FIND, this.onFindRequested)
    mediator.removeListener(events.RELOAD, this.onFileReloading)
  }

  async setTitle () {
    let f = new File('package.json')
    await f.read()
    let p = JSON.parse(f.content)
    this.browserWindow.setTitle(`${p.appName} v${p.version}`)
  }

  close () {
    this.browserWindow.close()
  }

  async onContentsWillNavigate (e, url) {
    // Renderer file: Reload.
    if (url === URL) {
      return
    }

    // Prevent navigation in this application.
    e.preventDefault()

    // Markdown file: Render it.
    if (EXTENSIONS.indexOf(extname(url).toLowerCase()) !== -1) {
      url = url.replace(/^file:\/+/, '/')
      await this.start(url)
      this.render()
      return
    }

    // Others: Open external application.
    shell.openExternal(url)
  }

  async onFileChanging (_, path) {
    await this.start(path)
    this.render()
  }

  async onHistoryBackwarding (_, path) {
    await this.start(path)
    this.browserWindow.webContents.send('history-backwarded', this.file)
  }

  async onHistoryForwarding (_, path) {
    await this.start(path)
    this.browserWindow.webContents.send('history-forwarded', this.file)
  }

  onFocus () {
    this.browserWindow.webContents.send('focus')
  }

  onBlur () {
    this.browserWindow.webContents.send('blur')
  }

  onMoved () {
    this.registerBounds()
  }

  onResized () {
    this.registerBounds()
    this.browserWindow.webContents.send('resize', this.browserWindow.getSize())
  }

  onClose () {
    this.destruct()
    this.emit('close', {
      currentTarget: this
    })
    Window.remove(this)
  }

  onOpenFileRequested () {
    if (!this.browserWindow.isFocused()) {
      return
    }
    showOpenDialog({
      properties: ['openFile']
    }, async (filenames) => {
      if (!filenames || !filenames[0]) {
        return
      }
      await this.start(filenames[0])
      this.render()
    })
  }

  onToggleDevToolsRequested () {
    if (!this.browserWindow.isFocused()) {
      return
    }
    this.browserWindow.toggleDevTools()
  }

  onFindRequested () {
    if (!this.browserWindow.isFocused()) {
      return
    }
    this.browserWindow.webContents.send('openFind')
  }

  async onFileReloading () {
    if (!(this.browserWindow.isFocused() && this.file)) {
      return
    }

    await this.file.read()
    this.render()
  }

  registerBounds () {
    this.storage.set('bounds', this.browserWindow.getBounds(), (err) => {
      if (err != null) {
        throw err
      }
    })
  }

  async onFileChanged (path) {
    await this.file.read()
    this.updateFile()
  }

  async start (path) {
    path = normalize(path)

    if (this.watcher != null) {
      this.watcher.removeAllListeners()
      this.watcher.close()
    }

    // Watch only local file.
    if (!(/^https?:\/\//.test(path))) {
      this.watcher = watch(path)
      this.watcher.on('change', this.onFileChanged)
    }

    this.file = new File(path)
    await this.file.read()

    mediator.emit(events.START_FILE, path)
  }

  render () {
    this.browserWindow.webContents.send('file-changed', this.file)
  }

  updateFile () {
    this.browserWindow.webContents.send('file-updated', this.file)
  }
}
