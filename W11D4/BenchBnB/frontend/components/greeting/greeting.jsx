import React from 'react';
import { Link } from 'react-router-dom';

const loginInfo = () => {
  
  return (
    <div className='login-info'>
      <Link to='/signup'>Sign Up</Link> or <Link to='/login'>Log In</Link>
    </div>
  )
};

const logoutInfo = (currentUser, logout) => (
  <div className='logout-info'>
    <h2>Welcome {currentUser.username}</h2>
    <button onClick={logout}>Log Out</button>
  </div>
)

const Greeting = ({ currentUser, logout }) => {
  return (
    <div>
      {currentUser === undefined ? loginInfo() : logoutInfo(currentUser, logout)}
    </div>
  );
};

export default Greeting;