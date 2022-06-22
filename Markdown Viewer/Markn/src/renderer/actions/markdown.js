import dispatcher from '../dispatcher'

export default new class MarkdownAction {
  updated (marks) {
    dispatcher.emit('updated')
  }
}
