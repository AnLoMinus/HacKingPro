import EventEmitter from 'events'
import ipc from 'ipc'

export default new class FileStore extends EventEmitter {
  constructor () {
    super()
    ipc.on('file-changed', this.onFileChanged.bind(this))
    ipc.on('file-updated', this.onFileUpdated.bind(this))
  }

  onFileChanged (file) {
    this.emit('changed', file)
  }

  onFileUpdated (file) {
    this.emit('updated', file)
  }
}
