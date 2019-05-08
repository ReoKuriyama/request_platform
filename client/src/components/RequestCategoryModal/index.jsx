import React from 'react'
import './index.scss'

class RequestCategory extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isToggleOn: true};

    // This binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(state => ({
      isToggleOn: !state.isToggleOn
    }));
  }

  render() {
    return (
      <button className='requestCategoryModal' onClick={this.handleClick}>
      {this.props.title}
      </button>
    );
  }
}

export default RequestCategory
