import React from 'react';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {
  faFacebookF,
  faTwitter,
  faGoogle,
  faInstagram,
  faLinkedin,
  
} from '@fortawesome/free-brands-svg-icons';
import {
  faGem,
  faEnvelope,
  faPhone,
 
} from '@fortawesome/free-solid-svg-icons';
import './styles/Footer.css';

export default function Footer() {
  return (
    <div>
      <footer className="text-center text-lg-start  text-white footer"> 
        <section className="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
          <div className="me-5 d-none d-lg-block">
            <span>Get connected with us on social networks:</span>
          </div>
          <div>
            <a href="https://www.facebook.com/" className="me-4 text-reset">
              <FontAwesomeIcon icon={faFacebookF} />
            </a>
            <a href="https://twitter.com/" className="me-4 text-reset">
              <FontAwesomeIcon icon={faTwitter} />
            </a>
            <a href="https://plus.google.com/" className="me-4 text-reset">
              <FontAwesomeIcon icon={faGoogle} />
            </a>
            <a href="https://www.instagram.com/" className="me-4 text-reset">
              <FontAwesomeIcon icon={faInstagram} />
            </a>
            <a href="https://www.linkedin.com/" className="me-4 text-reset">
              <FontAwesomeIcon icon={faLinkedin} />
            </a>
           
          </div>

        </section>
        <section className="">
          <div className="container text-center text-md-start mt-5">
            <div className="row mt-3">
              <div className="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                <h6 className="text-uppercase fw-bold mb-4">
                  <FontAwesomeIcon icon={faGem} className="me-3 text-reset" />
                  iTank
                </h6>
                <p>
                  Feel Free to contact us for your any problems 
                </p>
              </div>
              <div className="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                <h6 className="text-uppercase fw-bold mb-4">
                  Products
                </h6>
                <p>
                  <a href="#!" className="text-reset">iTank</a>
                </p>
                
                
                
              </div>
             
              <div className="col-md-2 col-lg-2 col-xl-2 mx-auto mb-md-0 mb-4">
                <h6 className="text-uppercase fw-bold mb-4">Contact</h6>
                <p>
                  <FontAwesomeIcon icon={faEnvelope} className="me-3" />
                 iTank@gmail.com
                </p>
                <p><FontAwesomeIcon icon={faPhone} className="me-3" /> +94 705156085</p>
              </div>
            </div>
          </div>
        </section>
        <div className="text-center p-4" style={{ backgroundColor: 'rgba(0, 0, 0, 0.05)' }}>
          © 2023 Copyright<br/>
          <h6 className="text-reset fw-bold">iTanks</h6>
        </div>
      </footer>
    </div>
  );
}
