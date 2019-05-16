import React from 'react'
//import './index.scss'

class PlusCountButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: props.count };

    this.handleClick = this.handleClick.bind(this);
  }


  handleClick() {
    this.setState(state => ({
      count: state.count += 1
    }));
  }

  render() {
    return (
      <button className='plusCountButton' onClick={ this.handleClick }>
        { this.state.count }
      </button>
    );
  }
}

export default PlusCountButton

