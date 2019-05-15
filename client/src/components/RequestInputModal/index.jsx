import React from 'react'
import axios from 'axios';
import './index.scss'

import TextInput from '../TextInput/index'

class RequestInputModal extends React.Component {
  constructor(props) {
    super(props);
    this.state =  {};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }


  handleChange(event) {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;
    this.setState({
        [name]: value
    });
  }

  handleSubmit(event) {
    const closeNewRequestModal = this.props.closeModal
    event.preventDefault();
    axios.post('http://localhost:3001/requests', {
      request: this.state
    })
      .then(function (response) {
        console.log(response);
        closeNewRequestModal()
      })
      .catch(function (error) {
        console.log(error);
      });
  }

  render() {
    const props = [
      { label: '作成者', className: 'creator', name: 'creator', onTextChange: this.handleChange },
      { label: '概要', className: 'summary', name: 'summary', onTextChange: this.handleChange },
      { label: '事業所番号', className: 'officeId', name: 'office_id', onTextChange: this.handleChange },
      { label: 'カテゴリーID', className: 'RequestCategoryIdd', name: 'request_category_id', onTextChange: this.handleChange }

      ]

    return (
      <div className='requestInputModal'>
        {props.map((props, i) =>
          <TextInput key={i} {...props} />)
        }
        <input type="submit" value="Submit" onClick={this.handleSubmit}/>
      </div>
    );
  }
}

export default RequestInputModal
