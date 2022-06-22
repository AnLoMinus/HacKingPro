import {readFile} from 'fs'

export default class File {
  constructor (path) {
    this.path = path
    this.content = ''
  }

  async read () {
    return new Promise((resolve, reject) => {
      readFile(this.path, 'utf8', (err, content) => {
        if (err) return reject(err)
        this.content = content
        resolve()
      })
    })
  }
}
