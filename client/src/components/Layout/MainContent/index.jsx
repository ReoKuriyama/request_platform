import React from 'react'
import RequestCategoryModal from '../../RequestCategoryModal/index'
import './index.scss'

class MainContent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {categories: [
      {title: "Category1", requests: [{date: "2019/04/01", title: "Request1-1", content: "memomemomemomemomemomemomemomemo"}, {date: "2019/10/01", title: "Request1-2", content: "testtesttest"}]},
      {title: "Category2", requests: [{title: "Request2"}]},
      {title: "Category3", requests: [{title: "Request3"}]},
      {title: "Category4", requests: [{title: "Request4"}]},
      {title: "Category5", requests: [{title: "Request5"}]},
    ]};
  }

  render() {
    return (
      <div className='mainContent'>
        {this.state.categories.map((requestCategory, i) =>
         <RequestCategoryModal key={i} title={requestCategory.title} requests={requestCategory.requests} />)}
      </div>
    );
  }
}

export default MainContent
