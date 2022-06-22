import reporter from 'crash-reporter'
reporter.start()
import {resolve, join} from 'path'
import {statSync} from 'fs'
import app from 'app'
import dialog from 'dialog'
import shell from 'shell'
import mediator from './mediator'
import events from './events'
import Menu from './menu'
import Window from './window'

export default class Main {
  constructor () {
    this.VERSION = app.getVersion()
    this.onWindowClose = this.onWindowClose.bind(this)
    this.onOpenHelpRequested = this.onOpenHelpRequested.bind(this)
    this.onOpenAboutDialogRequested = this.onOpenAboutDialogRequested.bind(this)
    this.onQuitRequested = this.onQuitRequested.bind(this)
    this.onOpenNewWindowRequested = this.onOpenNewWindowRequested.bind(this)
    this.onQuit = this.onQuit.bind(this)
    this.onWindowAllClosed = this.onWindowAllClosed.bind(this)
    this.onReady = this.onReady.bind(this)

    app.on('ready', this.onReady)
    app.on('window-all-closed', this.onWindowAllClosed)
    app.on('quit', this.onQuit)
    mediator.on(events.OPEN_NEW_WINDOW, this.onOpenNewWindowRequested)
    mediator.on(events.QUIT, this.onQuitRequested)
    mediator.on(events.OPEN_ABOUT_DIALOG, this.onOpenAboutDialogRequested)
    mediator.on(events.OPEN_HELP, this.onOpenHelpRequested)
  }

  onReady () {
    let {argv} = process
    console.log('Markn argv:', argv)
    let filename = argv[1]
    if (filename) {
      filename = resolve(filename)
      console.log(`try to open ${filename}`)
      try {
        let stats = statSync(filename, 'r')
        if (!stats.isFile()) {
          filename = null
        }
      } catch (err) {
        console.error(err)
        filename = null
      }
    }

    this.menu = new Menu()
    this.openNewWindow(filename)
  }

  onWindowAllClosed () {
    if (process.platform !== 'darwin') {
      app.quit()
    }
  }

  onQuit () {
    console.log('onQuit')
    this.closeAllWindows()
  }

  onOpenNewWindowRequested () {
    this.openNewWindow()
  }

  onQuitRequested () {
    this.quit()
  }

  onOpenAboutDialogRequested () {
    this.openAboutDialog()
  }

  onOpenHelpRequested () {
    this.openHelp()
  }

  openNewWindow (filename) {
    if (!filename) {
      filename = join(__dirname, '../README.md')
    }
    console.log(`open ${filename}`)

    let window = new Window(filename)
    window.on('close', this.onWindowClose)
  }

  closeAllWindows () {
    Window.closeAllWindows()
  }

  onWindowClose (e) {
    let window = e.currentTarget
    window.removeAllListeners()
  }

  quit () {
    app.quit()
  }

  openAboutDialog () {
    dialog.showMessageBox({
      type: 'info',
      buttons: ['ok'],
      title: 'About Markn',
      message: 'Markn',
      detail: 'Lightweight markdown viewer\nv' + this.VERSION
    })
  }

  openHelp () {
    shell.openExternal('https://github.com/minodisk/markn/blob/v' + this.VERSION + '/README.md#readme')
  }
}

global.main = new Main()
