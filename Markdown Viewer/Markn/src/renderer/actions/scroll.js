import dispatcher from '../dispatcher'

export default new class ScrollAction {
  scrolled (scrollTop) {
    dispatcher.emit('scrolled', scrollTop)
  }
}
