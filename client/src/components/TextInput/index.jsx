import React from 'react'

const TextInput = ({label, className, name, onTextChange}) => {
  return <div> 
          <label>
            {label}
            <input 
             className={className}
             name={name}
             type="text"
             onChange={onTextChange} />
          </label>
        </div>
};

export default TextInput
