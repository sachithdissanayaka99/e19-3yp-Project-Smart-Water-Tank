import React, { useState } from "react";
import Layout from "../../components/layout";
import './styles/usage.css'; 

export default function Usage() {

  const [reminderValue, setReminderValue] = useState(80);
  const pastMonthUsage = 200;
  const currentMonthUsage = 120;
  const billUntilToday = 150;

  return (
    <Layout>
      <div className='control-container'>
        <h1 className='page-title'>Water Control</h1>

        <div className='usage-info'>
          <h2>Usage Information</h2>
          <p>Past Month Usage: {pastMonthUsage} </p>
          <p>Current Month Usage (until today): {currentMonthUsage}</p>
          <p>Bill (until today): Rs:{billUntilToday}</p>
        </div>

        <div className='reminder-section'>
          <h2>Set Water Level Reminder</h2>
          <label htmlFor='reminderValue'>Set Reminder at:</label>
          <input
            type='number'
            id='reminderValue'
            value={reminderValue}
            onChange={(e) => setReminderValue(e.target.value)}
          />
          <button
            onClick={() => alert(`Reminder set to ${reminderValue}%`)}
          >
            Set Reminder
          </button>
        </div>
      </div>
    </Layout>
  );
}
