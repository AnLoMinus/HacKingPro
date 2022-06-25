import app from 'app'
import {join} from 'path'
import {readFile, writeFile} from 'fs'

export default class Storage {
  constructor () {
    this.dataDir = app.getPath('userData')
  }

  get (key, cb) {
    readFile(this.path(key), 'utf8', (err, data) => {
      if (err != null) {
        cb(err)
        return
      }
      cb(null, JSON.parse(data))
    })
  }

  set (key, val, cb) {
    writeFile(this.path(key), JSON.stringify(val), (err) => {
      cb(err)
    })
  }

  path (key) {
    return join(this.dataDir, key)
  }
}
