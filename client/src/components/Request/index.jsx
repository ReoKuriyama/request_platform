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
          <li>
             { request.date }
          </li>
          <li>
             { request.title }
          </li>
          <li>
             { request.content }
          </li>
        </ul>
      </div>
    );
  }
}

export default Request
