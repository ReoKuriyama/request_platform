import React from 'react'
import './index.scss'

class Request extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isToggleOn: true};

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    console.log(1);
  }

  render() {
    const request = this.props.request
    return (
      <div className='requestModal' onClick={this.handleClick}>
        <ul>
          <li className='createdAt'>
             { request.attributes.created_at }
          </li>
          <li className='summary'>
             { request.attributes.summary }
          </li>
          <li>
             { request.attributes.count }
          </li>
        </ul>
      </div>
    );
  }
}

export default Request
