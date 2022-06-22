import React from 'react'
import classnames from 'classnames'
import searchStore from '../stores/search'
import searchAction from '../actions/search'

export default class SearchComponent extends React.Component {
  displayName = 'SearchComponent'

  constructor (props) {
    super(props)
    this.state = {
      current: 0,
      total: 0,
      isShown: false,
      disabled: false
    }

    this.store = searchStore
    this.store.on('openFind', this.show.bind(this))
    this.store.on('closeFind', this.hide.bind(this))
    this.store.on('disabling', this.onDisabling.bind(this))
    this.store.on('enabling', this.onEnabling.bind(this))
    this.store.on('indicating', this.onIndicating.bind(this))
  }

  show () {
    this.setState({isShown: true})
    let input = React.findDOMNode(this.refs.search)
    input.focus()
    input.select()
  }

  hide () {
    this.setState({isShown: false})
  }

  onDisabling () {
    this.setState({disabled: true})
  }

  onEnabling () {
    this.setState({disabled: false})
  }

  onIndicating (current, total) {
    this.setState({current, total})
  }

  render () {
    return (
      <div className={classnames('search-box', {'is-shown': this.state.isShown})}>
        <div className='search'>
          <input type='text' ref='search' onInput={searchAction.input} onKeyDown={searchAction.keydown}/>
          <span className='indication'>{this.state.total === 0 ? '' : `${this.state.current + 1} / ${this.state.total}`}</span>
        </div>
        <button className='fa fa-chevron-up button-up' disabled={this.state.disabled} onClick={searchAction.backward}/>
        <button className='fa fa-chevron-down button-down' disabled={this.state.disabled} onClick={searchAction.forward}/>
        <button className='fa fa-times button-close' onClick={searchAction.close}/>
      </div>
    )
  }
}
