import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import './styles/Header.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faTint } from '@fortawesome/free-solid-svg-icons';

export default function Header({ isAuthenticated = 'signout' }) {
  const [activeButton, setActiveButton] = useState('register');

  const handleButtonClick = (button) => {
    setActiveButton(button);
  };

  return (
    <header className="d-flex flex-wrap justify-content-center py-3 border-bottom">
      <Link to="/" className="d-flex align-items-center mb-4 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
        <svg className="bi " width="20" height="42"><use xlinkHref="#bootstrap"></use></svg>
        <h3 className='tank-i'>
          <FontAwesomeIcon icon={faTint} className="tank-icon" />
          iTank
        </h3>
      </Link>

      <ul className="nav nav-pills">
        <li className={`nav-item ${activeButton === 'register' ? 'active' : ''}`}>
          <Link
            to="/register"
            className="nav-link"
            onClick={() => handleButtonClick('register')}
          >
            Register
          </Link>
        </li>
        {isAuthenticated !== 'signout' && (
          <>
            <li className={`nav-item ${activeButton === 'appointment' ? 'active' : ''}`}>
              <Link
                to="/profile"
                className="nav-link"
                onClick={() => handleButtonClick('appointment')}
              >
                Appointment
              </Link>
            </li>
            <li className={`nav-item ${activeButton === 'profile' ? 'active' : ''}`}>
              <Link
                to="/device"
                className="nav-link"
                onClick={() => handleButtonClick('profile')}
              >
                Profile
              </Link>
            </li>
          </>
        )}
      </ul>
    </header>
  );
}
