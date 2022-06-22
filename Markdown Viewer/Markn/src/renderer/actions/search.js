import dispatcher from '../dispatcher'

export default new class SearchAction {
  close () {
    dispatcher.emit('closeFind')
  }

  input (e) {
    dispatcher.emit('searching', e.currentTarget.value)
  }

  keydown (e) {
    if (e.key !== 'Enter') return
    dispatcher.emit('forwarding')
  }

  forward () {
    dispatcher.emit('forwarding')
  }

  backward () {
    dispatcher.emit('backwarding')
  }

  searched (marks) {
    dispatcher.emit('searched', marks)
  }
}
