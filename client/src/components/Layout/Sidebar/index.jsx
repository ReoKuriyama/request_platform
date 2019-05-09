import React from 'react'
import SidebarIcon from '../../SidebarIcon/index'
import './index.scss'

class Sidebar extends React.Component {
  render() {
    return (
      <div className='sidebar'>
        <SidebarIcon image="home"/>
      </div>
    );
  }
}

export default Sidebar
