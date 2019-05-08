import React, { Component } from 'react';
import LayoutContainer from './components/Layout/index'
import './App.css';

import './reset.css'

class App extends Component {
  render() {
    return (
      <div className="App">
        <LayoutContainer/>
      </div>
    );
  }
}

export default App;

