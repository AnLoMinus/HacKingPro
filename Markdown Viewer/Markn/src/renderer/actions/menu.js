import dispatcher from '../dispatcher'

export default new class MenuAction {
  toggle () {
    dispatcher.emit('toggle-menu')
  }
}
