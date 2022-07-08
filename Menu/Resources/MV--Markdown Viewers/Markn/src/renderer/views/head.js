import React from 'react'
import Nav from './nav'
import Search from './search'

export default class HeadComponent extends React.Component {
  displayName = 'HeadComponent'

  constructor (props) {
    super(props)
  }

  render () {
    return (<div className='head'>
      <Nav/>
      <Search/>
    </div>)
  }
}
