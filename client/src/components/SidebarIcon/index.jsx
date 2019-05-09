import React from 'react'
import './index.scss'

class SidebarIcon extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isToggleOn: true};

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(state => ({
      isToggleOn: !state.isToggleOn
    }));
  }

  render() {
    return (
      <button className='sidebarIcon' onClick={this.handleClick}>
        {this.state.isToggleOn ? this.props.image : 'OFF'}
      </button>
    );
  }
}

export default SidebarIcon
