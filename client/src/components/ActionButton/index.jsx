import React from 'react'
import './index.scss'

class ActionButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isToggleOn: true};

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.props.openModal(e.target.value);
  }

  render() {
    return (
      <div className='btn-circle-3d' onClick={this.handleClick}>新規作成</div>
    );
  }
}


export default ActionButton
