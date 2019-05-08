import React from 'react'
import RequestCategoryModal from '../../RequestCategoryModal/index'
import './index.scss'

class MainContent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: "Request Title", content: "sample sample"};
  }

  render() {
    return (
      <div className='mainContent'>
        <RequestCategoryModal title={this.state.title} />
        <RequestCategoryModal title="Category1" />
      </div>
    );
  }
}

export default MainContent
