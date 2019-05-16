import React from 'react'
import './index.scss'

import PlusCountButton from '../PlusCountButton/index'

const Request = ({request}) => 
  <div className='requestModal'>
    <li className='createdAt'>
      { request.created_at }
    </li>
    <li className='summary'>
      { request.summary }
    </li>
    <PlusCountButton count={request.count} id={request.id} />
  </div>

export default Request
