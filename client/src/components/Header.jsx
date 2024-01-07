import React from "react";
import { Link } from "react-router-dom";
import "./styles/Header.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faTint } from "@fortawesome/free-solid-svg-icons";

export default function Header() {
  const token = localStorage.getItem("token");

  return (
    <header className="d-flex flex-wrap justify-content-center py-3 border-bottom">
      <Link
        to="/"
        className="d-flex align-items-center mb-4 mb-md-0 me-md-auto link-body-emphasis text-decoration-none"
      >
        <svg className="bi " width="20" height="42">
          <use xlinkHref="#bootstrap"></use>
        </svg>
        <h3 className="tank-i">
          <FontAwesomeIcon icon={faTint} className="tank-icon" />
          iTank
        </h3>
      </Link>
      {console.log(token ? "true" : "false")}
      {token ? <div></div> :<ul className="nav nav-pills">
        <li className={`nav-item`}>
          <Link to="/register" className="nav-link">
            Register
          </Link>
        </li>
      </ul>
      }
    </header>
  );
}
