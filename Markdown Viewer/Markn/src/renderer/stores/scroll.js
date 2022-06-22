import EventEmitter from 'events'
import dispatcher from '../dispatcher'

export default new class ScrollStore extends EventEmitter {
  constructor () {
    super()

    dispatcher.on('searched', this.onSearched.bind(this))
    dispatcher.on('scrolled', this.onScrolled.bind(this))
  }

  onSearched (marks) {
    this.emit('searched', marks)
  }

  onScrolled (scrollTop) {
    this.emit('scrolled', scrollTop)
  }
}
