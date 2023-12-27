import React, { useState } from "react";
import { Link, useLocation } from "react-router-dom";
import "./styles/layout.css";

function Layout({ children }) {
  const location = useLocation();

  const userMenu = [
    {
      name: "Devices",
      icon: "ri-home-2-fill",
      path: "/userHome",
    },
    {
      name: "Profile",
      icon: "ri-file-user-fill",
      path: "/profile",
    },
    {
      name: "Logout",
      icon: "ri-logout-box-r-fill",
      path: "/logout",
    },
  ];

  const menuToBeRendered = userMenu;

  return (
    <div className="main">
      <div className="d-flex layout">
        <div className="sidebar">
          <div className="slide-bar-header">
            <h1>iTank</h1>
          </div>

          <div className="menu">
            {menuToBeRendered.map((menu) => {
              const isActive = location.pathname === menu.path;

              return (
                <div
                  key={menu.name}
                  className={`d-flex menu-item ${isActive && "active-menu-item"}`}
                  
                >
                  <i className={menu.icon}></i>
                  <Link to={menu.path}>{menu.name}</Link>
                </div>
              );
            })}
          </div>
        </div>
        <div className="content">
          <div className="header">header</div>
          <div className="body">{children}</div>
        </div>
      </div>
    </div>
  );
}

export default Layout;
