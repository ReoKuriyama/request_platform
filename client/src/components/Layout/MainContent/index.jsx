import React from 'react'
import axios from 'axios';
import RequestCategoryModal from '../../RequestCategoryModal/index'
import NewRequestModal from '../../NewRequestModal/index'
import './index.scss'

class MainContent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: {data: [], included: []},
      formatted_categories: []
    };
  }

  componentDidMount() {
    axios.get('http://localhost:3001/requests')
    .then((results) => {
      this.setState({categories: results.data})

      const info = this.state
      const requestsSortByCategory = [];
      info.categories.data.map(function(category) {
        const requests = [];
        category.relationships.requests.data.map(function(request) {
          requests.push(info.categories.included.find(item => item.id === request.id).attributes);
        });
        requestsSortByCategory.push(requests);
      });
      this.setState({formatted_categories: requestsSortByCategory})
    })
  }

  render() {

    return (
      <div className='mainContent'>
        {this.state.categories.data.map((requestCategory, i) =>
         <RequestCategoryModal key={i} title={requestCategory.attributes.name} requests={this.state.formatted_categories[i]} />)}
         <NewRequestModal />
      </div>
    );
  }
}

export default MainContent
