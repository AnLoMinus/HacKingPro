import dispatcher from '../dispatcher'

export default new class AppAction {
  ready () {
    dispatcher.emit('ready')
  }
}
