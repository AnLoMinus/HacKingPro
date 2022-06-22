import React from 'react'
import scrollStore from '../stores/scroll'

export default class RailComponent extends React.Component {
  displayName = 'RailComponent'

  constructor (props) {
    super(props)
    this.state = {
      marks: [],
      scrollTop: 0
    }

    window.addEventListener('resize', this.onResized.bind(this), false)
    scrollStore.on('searched', this.onSearched.bind(this))
    scrollStore.on('scrolled', this.onScrolled.bind(this))
  }

  onResized () {
    this.forceUpdate()
  }

  onSearched (marks) {
    this.setState({marks})
  }

  onScrolled (scrollTop) {
    this.setState({scrollTop})
  }

  render () {
    return (
      <div className='rail'>{
        this.state.marks.map((mark) => {
          let rect = mark.getBoundingClientRect()
          let style = {top: Math.round(this.state.scrollTop + rect.top + rect.height / 2 - 1.5)}
          return <div className='mark' style={style}></div>
        })
      }</div>
    )
  }
}
