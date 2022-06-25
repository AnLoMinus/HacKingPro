import React from 'react'
import fileStore from '../stores/file'
import historyStore from '../stores/history'
import historyAction from '../actions/history'
import menuAction from '../actions/menu'

export default class NavComponent extends React.Component {
  displayName = 'NavComponent'

  constructor (props) {
    super(props)
    this.state = {
      canBackward: false,
      canForward: false,
      path: ''
    }

    fileStore.on('changed', this.onFileChanged.bind(this))
    historyStore.on('state-change', this.onHistoryStateChanged.bind(this))
    historyStore.on('forwarded', this.onHistoryUpdated.bind(this))
    historyStore.on('backwarded', this.onHistoryUpdated.bind(this))
  }

  render () {
    return (
      <div ref='nav' className='nav'>
        <button className='backward' disabled={!this.state.canBackward} onClick={historyAction.backward}/>
        <button className='forward' disabled={!this.state.canForward} onClick={historyAction.forward}/>
        <button className='reload' disabled={this.state.disabled} onClick={historyAction.reload}/>
        <input className='path' type='text' value={this.state.path} onChange={this.onChange.bind(this)} onKeyDown={this.onKeyDown.bind(this)}/>
        <button className='tools' onClick={menuAction.toggle}/>
      </div>
    )
  }

  onChange (e) {
    let input = e.currentTarget
    let path = input.value
    this.setState({path})
  }

  onKeyDown (e) {
    switch (e.key) {
      case 'Enter':
        historyAction.change(this.state.path)
        break
    }
  }

  onFileChanged (file) {
    console.log('onFileChanged:', file.path)
    this.setState({path: file.path})
  }

  onHistoryStateChanged (state) {
    this.setState(state)
  }

  onHistoryUpdated (file) {
    console.log('onHistoryUpdated:', file.path)
    this.setState({path: file.path})
  }
}
