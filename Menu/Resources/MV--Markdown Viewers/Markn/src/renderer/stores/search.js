import EventEmitter from 'events'
import dispatcher from '../dispatcher'
import ipc from 'ipc'

export default new class SearchStore extends EventEmitter {
  constructor () {
    super()

    this.focusedIndex = 0
    this.marks = []

    ipc.on('openFind', this.onOpenFind.bind(this))
    dispatcher.on('closeFind', this.onCloseFind.bind(this))
    dispatcher.on('searching', this.onSearching.bind(this))
    dispatcher.on('searched', this.onSearched.bind(this))
    dispatcher.on('forwarding', this.onForwarding.bind(this))
    dispatcher.on('backwarding', this.onBackwarding.bind(this))
  }

  onOpenFind () {
    this.emit('openFind')
  }

  onCloseFind () {
    this.emit('closeFind')
  }

  onSearching (word) {
    this.emit('searching', word)
  }

  onSearched (marks) {
    this.focusedIndex = 0
    this.marks = marks

    if (this.marks.length === 0) {
      this.emit('disabling')
    } else {
      this.emit('enabling')
    }

    this.onForwarding()
  }

  onForwarding () {
    this.moveIndication(1)
  }

  onBackwarding () {
    this.moveIndication(-1)
  }

  moveIndication (delta) {
    let len = this.marks.length
    let mark = this.marks[this.focusedIndex]
    this.emit('indicating', this.focusedIndex, len, mark)

    if (len === 0) {
      return
    }

    this.focusedIndex += delta
    if (this.focusedIndex >= len) {
      this.focusedIndex = 0
    }
    if (this.focusedIndex < 0) {
      this.focusedIndex = len - 1
    }
  }
}
