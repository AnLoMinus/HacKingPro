import ipc from 'ipc'
import dispatcher from '../dispatcher'

export default new class HistoryAction {
  backward () {
    dispatcher.emit('history-backwarding')
  }

  forward () {
    dispatcher.emit('history-forwarding')
  }

  reload () {
    ipc.send('file-reloading')
  }

  change (path) {
    ipc.send('file-changing', path)
  }
}
