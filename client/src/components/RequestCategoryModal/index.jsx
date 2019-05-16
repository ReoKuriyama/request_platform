import React from 'react'
import './index.scss'

import Request from '../Request/index'

class RequestCategory extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isToggleOn: false };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(state => ({
      isToggleOn: !state.isToggleOn
    }));
  }

  render() {
    return (
     <div className='request'>
        <button className='requestCategoryModal' onClick={ this.handleClick }>
          { this.props.title }
        </button>

      {this.state.isToggleOn &&
        this.props.requests.map((request, i) =>
          <Request key={i} request={request} />)
      }
      </div>
    );
  }
}

export default RequestCategory
