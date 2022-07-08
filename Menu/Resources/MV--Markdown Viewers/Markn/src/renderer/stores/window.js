import EventEmitter from 'events'
import dispatcher from '../dispatcher'
import ipc from 'ipc'

export default new class WindowStore extends EventEmitter {
  constructor () {
    super()

    window.addEventListener('resize', this.onResized.bind(this))

    ipc.on('focus', this.onFocus.bind(this))
    ipc.on('blur', this.onBlur.bind(this))
    ipc.on('resize', this.onResize.bind(this))

    dispatcher.on('ready', this.onReady.bind(this))
  }

  onFocus () {
    this.emit('focus')
  }

  onBlur () {
    this.emit('blur')
  }

  onReady () {
    this.onFocus()
    this.resize()
  }

  onResize (size) {
    this.resize()
  }

  onResized () {
    this.resize()
  }

  resize () {
    this.emit('resize', {x: window.innerWidth, y: window.innerHeight})
  }
}
