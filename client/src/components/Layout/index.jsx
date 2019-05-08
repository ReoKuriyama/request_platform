import React from 'react'
import Sidebar from './Sidebar/index'
import './index.scss'

class LayoutContainer extends React.Component {
  render() {
    return (
      <div className='layout'>
        <Sidebar/>
      </div>
    );
  }
}

export default LayoutContainer
