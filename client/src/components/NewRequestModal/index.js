import React from 'react';
//import ReactDOM from 'react-dom';
import Modal from 'react-modal';

import RequestInputModal from '../RequestInputModal/index'
import ActionButton from '../ActionButton/index';

const customStyles = {
  content : {
    width                 : '600px',
    height                : '800px',
    top                   : '50px',
    left                  : 'calc((100vw - 600px) / 2)',
    right                 : 'auto',
    bottom                : 'auto',
    padding               : 'none',
    border                : 'none',
    boxShadow            : 'grey 0px 0px 19px 3px'
  }
};

Modal.setAppElement('#root')

class NewRequestModal extends React.Component {
  constructor() {
    super();

    this.state = {
      modalIsOpen: false
    };

    this.openModal = this.openModal.bind(this);
    this.afterOpenModal = this.afterOpenModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
  }

  openModal() {
    this.setState({modalIsOpen: true});
  }

  afterOpenModal() {
    // references are now sync'd and can be accessed.
    //this.subtitle.style.color = '#f00';
  }

  closeModal() {
    this.setState({modalIsOpen: false});
  }

  render() {
    return (
      <div>
        <ActionButton openModal={this.openModal} />
        <Modal
          isOpen={this.state.modalIsOpen}
          onAfterOpen={this.afterOpenModal}
          onRequestClose={this.closeModal}
          style={customStyles}
          contentLabel="Example Modal"
        >
          <RequestInputModal closeModal={this.closeModal} />
        </Modal>
      </div>
    );
  }
}

export default NewRequestModal
