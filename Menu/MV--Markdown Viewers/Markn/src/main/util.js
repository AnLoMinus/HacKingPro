export default {
  bindTarget: function (cb) {
    return function (e) {
      e.currentTarget = this
      return cb(e)
    }
  }
}
