import React from "react";
import { Navigate } from "react-router-dom";

function protectedRoute(props) {
  if (localStorage.getItem("token")) {
    return props.children;
  } else {
    return <Navigate to="/login" />;
  }
}

export default protectedRoute;
