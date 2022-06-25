import React from 'react'
import RootComponent from './views/root'

var $ = React.createElement

export default class App {
  constructor () {
    React.render($(RootComponent, {}), document.body)
  }
}

window.app = new App()
