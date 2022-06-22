import EventEmitter from 'events'
import dispatcher from '../dispatcher'
import ipc from 'ipc'

export default new class HistoryStore extends EventEmitter {
  constructor () {
    super()
    this.pathes = []
    this.index = -1

    ipc.on('file-changed', this.onFileChanged.bind(this))
    ipc.on('history-backwarded', this.onHistoryBackwarded.bind(this))
    ipc.on('history-forwarded', this.onHistoryForwarded.bind(this))
    dispatcher.on('history-backwarding', this.backward.bind(this))
    dispatcher.on('history-forwarding', this.forward.bind(this))
  }

  onFileChanged (file) {
    if (file.path === this.pathes[this.pathes.length - 1]) {
      return
    }

    this.pathes.splice(this.index + 1)

    this.pathes.push(file.path)
    this.index = this.pathes.length - 1
    this.emitState()
  }

  emitState () {
    this.emit('state-change', {
      canBackward: this.canBackward(),
      canForward: this.canForward()
    })
  }

  canBackward () {
    return this.index > 0
  }

  canForward () {
    return this.index < (this.pathes.length - 1)
  }

  backward () {
    if (!this.canBackward()) return
    let path = this.pathes[this.index - 1]
    console.log('backward:', path)
    // this.emit('backward', path)
    ipc.send('history-backwarding', path)
  }

  forward () {
    if (!this.canForward()) return
    let path = this.pathes[this.index + 1]
    console.log('forward:', path)
    // this.emit('forward', path)
    ipc.send('history-forwarding', path)
  }

  onHistoryBackwarded (file) {
    console.log('onHistoryBackwarded:', file.path)
    this.index--
    this.emitState()
    this.emit('backwarded', file)
  }

  onHistoryForwarded (file) {
    console.log('onHistoryForwarded:', file.path)
    this.index++
    this.emitState()
    this.emit('forwarded', file)
  }
}
