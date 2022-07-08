import React from 'react'
import classnames from 'classnames'
import remote from 'remote'
import fileStore from '../stores/file'
import historyStore from '../stores/history'
import searchStore from '../stores/search'
import markdownAction from '../actions/markdown'
import searchAction from '../actions/search'
import Compiler from 'imports?React=react!../../../node_modules/md2react/src/index'
// import Compiler from 'imports?React=react!md2react'
import Highlight from 'react-highlight'

let path = remote.require('path')
let $ = React.createElement

export default class MarkdownComponent extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      md: '',
      dirname: '',
      search: '',
      indication: -1
    }

    this.compiler = new MyCompiler({
      gfm: true,
      breaks: true,
      tables: true,
      commonmark: true,
      footnotes: true
    })

    fileStore.on('changed', this.onFileChanged.bind(this))
    fileStore.on('updated', this.onFileUpdated.bind(this))
    historyStore.on('forwarded', this.onHistoryChanged.bind(this))
    historyStore.on('backwarded', this.onHistoryChanged.bind(this))
    searchStore.on('searching', this.onSearching.bind(this))
    searchStore.on('indicating', this.onIndicating.bind(this))
  }

  onFileChanged (file) {
    console.log('onFileChanged:', file.path)
    this.isUpdating = true
    this.setState({
      md: file.content,
      dirname: path.dirname(file.path)
    })
  }

  onFileUpdated (file) {
    console.log('onFileUpdated:', file.path)
    this.isUpdating = true
    this.setState({
      md: file.content,
      dirname: path.dirname(file.path)
    })
  }

  onHistoryChanged (file) {
    console.log('onHistoryChanged:', file.path)
    this.isUpdating = true
    this.setState({
      md: file.content,
      dirname: path.dirname(file.path)
    })
  }

  onSearching (search) {
    this.isSearching = true
    this.setState({search})
  }

  onIndicating (indication) {
    this.setState({indication})
  }

  render () {
    return this.compiler.compile(this.state)
  }

  componentDidUpdate () {
    if (this.isUpdating) {
      this.isUpdating = false
      markdownAction.updated()
    }
    if (this.isSearching) {
      this.isSearching = false
      let marks = []
      for (let i = 0; i < this.compiler.marksCount; i++) {
        let mark = React.findDOMNode(this.refs[`mark${i}`])
        marks.push(mark)
      }
      searchAction.searched(marks)
    }
  }
}

function highlight (code, lang, key) {
  return <Highlight className={lang}>{code}</Highlight>
}

class MyCompiler extends Compiler {
  constructor (opts) {
    opts.highlight = highlight
    super(opts)
  }

  compile ({md, dirname, search, indication}) {
    this.dirname = dirname
    if (search === '') {
      this.search = null
    } else {
      this.search = {
        text: search,
        regExp: new RegExp(`(${search})`, 'ig')
      }
    }
    this.indication = indication

    this.ids = {}
    this.marksCount = 0
    return super.compile(md)
  }

  root (node, defs, key, tableAlign) {
    return $('div', {
      key,
      className: 'markdown-body'
    }, this.toChildren(node, defs, key))
  }

  text (node, defs, key, tableAlign) {
    if (node.value.indexOf(':') !== -1) {
      let chunks = node.value
      .split(/:([0-9a-z_+-]+):/g)
      .map((type, i) => {
        if (i % 2 === 0) {
          return <span>{type}</span>
        }
        if (type.charAt(0) === '+') {
          type = type.substr(1)
        }
        return <i className={classnames('emoji', `emoji-${type}`)}></i>
      })
      return $('span', {}, chunks)
    }

    if (!this.search || node.value.indexOf(this.search.text) === -1) {
      return node.value
    }
    let words = node.value.split(this.search.regExp)
    words = words.map((word, i) => {
      if (i % 2 === 0) {
        return word
      }
      return $('mark', {
        className: this.marksCount === this.indication ? 'indicated' : '',
        ref: `mark${this.marksCount++}`
      }, word)
    })
    return $('span', {}, words)
  }

  image ({src, title, alt}, defs, key, tableAlign) {
    if (!(/^https?:\/\//.test(src))) {
      src = path.resolve(this.dirname, src)
    }
    return $('img', {
      key,
      src: src,
      title: title,
      alt: alt
    })
  }

  link (node, defs, key, tableAlign) {
    if (!(/^https?:\/\//.test(node.href))) {
      node.href = path.resolve(this.dirname, node.href)
    }
    return $('a', {
      key,
      href: node.href,
      title: node.title
    }, this.toChildren(node, defs, key))
  }

  heading (node, defs, key, tableAlign) {
    let text = node.children
      .filter((child) => { return child.type === 'text' })
      .map((child) => { return child.value })
      .join('')
    let id = text
      .toLowerCase()
      .replace(/\s/g, '-')
      .replace(/[!<>#%@&='"`:;,\.\*\+\(\)\{\}\[\]\\\/\|\?\^\$]+/g, '')
    if (this.ids[id] == null) {
      this.ids[id] = 0
    } else {
      this.ids[id]++
      id = `${id}-${this.ids[id]}`
    }
    return $((`h${node.depth.toString()}`), {key}, [
      $('a', {key: `${key}-a`, id: id, className: 'anchor', href: `#${id}`}, [
        $('span', {key: `${key}-a-span`, className: 'icon icon-link'})
      ]),
      this.toChildren(node, defs, key)
    ])
  }
}
