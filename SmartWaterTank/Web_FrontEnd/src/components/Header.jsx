import React from 'react';
import { Link } from 'react-router-dom';
import './styles/Header.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faTint } from '@fortawesome/free-solid-svg-icons';

export default function Header({ isAuthenticated = 'signout'}) {
  return (
    <header className="d-flex flex-wrap justify-content-center py-3 border-bottom">
      <Link to="/" className="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
        <svg className="bi " width="40" height="32"><use xlinkHref="#bootstrap"></use></svg>
        <h3 className='tank-i'>
          <FontAwesomeIcon icon={faTint} className="tank-icon" />
          iTank
        </h3>
      </Link>

      <ul className="nav nav-pills">
        <li className="nav-item"><Link to="/" className="nav-link">Home</Link></li>
        <li className="nav-item"><Link to="/about" className="nav-link">About</Link></li>
        <li className="nav-item"><Link to="/contact" className="nav-link">Contact</Link></li>
        {isAuthenticated === 'signout' ? (
          <>
            <li className="nav-item"><Link to="/register" className="nav-link">Register</Link></li>
          </>
        ) : (
          <>
            <li className="nav-item"><Link to="/profile" className="nav-link">Profile</Link></li>
            <li className="nav-item"><Link to="/device" className="nav-link">Device</Link></li>
          </>
          
        )}
      </ul>
    </header>
  );
}
