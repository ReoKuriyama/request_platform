import React from 'react'
import Sidebar from './Sidebar/index'
import MainContent from './MainContent/index'
import './index.scss'

class LayoutContainer extends React.Component {
  render() {
    return (
      <div className='layout'>
        <Sidebar />
        <MainContent />
      </div>
    );
  }
}

export default LayoutContainer
