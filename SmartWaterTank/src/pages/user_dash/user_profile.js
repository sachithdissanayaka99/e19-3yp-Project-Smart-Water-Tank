import React, { useState } from "react";
import Layout from "../../components/layout";
import "./styles/profile.css";

export default function UserProfile() {
  const [userName, setUserName] = useState("John Doe");
  const [phoneNumber, setPhoneNumber] = useState("123-456-7890");
  const [tankId, setTankId] = useState("ABC123");

  const handleUpdateProfile = () => {
    console.log("Profile updated successfully");
  };

  return (
    <Layout>
      <h1 className="page-title">User Profile</h1>
      <div className="profile-container">
        <div className="profiles-container">
          <label htmlFor="userName" className="profile-label">
            User Name:
          </label>
          <input
            type="text"
            id="userName"
            className="profile-input"
            value={userName}
            onChange={(e) => setUserName(e.target.value)}
          />
        </div>
        <div className="profiles-container">
          <label htmlFor="phoneNumber" className="profile-label">
            Phone Number:
          </label>
          <input
            type="text"
            id="phoneNumber"
            className="profile-input"
            value={phoneNumber}
            onChange={(e) => setPhoneNumber(e.target.value)}
          />
        </div>
        <div className="profiles-container">
          <label htmlFor="tankId" className="profile-label">
            Tank ID:
          </label>
          <input
            type="text"
            id="tankId"
            className="profile-input"
            value={tankId}
            onChange={(e) => setTankId(e.target.value)}
          />
        </div>
        <button className="profile-button " onClick={handleUpdateProfile}>
          Update Profile
        </button>
      </div>
    </Layout>
  );
}
