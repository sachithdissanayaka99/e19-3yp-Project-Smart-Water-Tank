import React, { useState } from "react";
import Layout from "../../components/layout";
import axios from "axios";
import { useSelector } from "react-redux";


import {
  Button,
  Switch,
  Card,
  Row,
  Col,
  InputNumber,
  notification,
} from "antd";
import { CheckCircleTwoTone, CloseCircleTwoTone } from "@ant-design/icons";
import "./styles/control_panel.css";
// const url = "http://localhost:4000";
// const url = "http://ec2-54-234-133-143.compute-1.amazonaws.com:4000";

export default function ControlPanel() {
  const [outputValve, setOutputValve] = useState(false);
  const [inputValve, setInputValve] = useState(false);
  const [motorPump, setMotorPump] = useState(false);

  const [waterLevelSensor, setWaterLevelSensor] = useState(true);
  const [inletValve, setInletValve] = useState(true);
  const [outletValve, setOutletValve] = useState(true);
  const { user } = useSelector((state) => state.user);

  const [monthlyBillGoal, setMonthlyBillGoal] = useState(100); // Set a default goal

  const handleOutputValveChange = async () => {
    setOutputValve(!outputValve);
    checkMonthlyGoal();

    try {
      const response = await axios.post(`/api/user/hardware/send-input-valve`, {
        userId: user?._id,
        string: `outputValve${!outputValve}`
      });
    } catch (error) {
      console.log(error);
    }
  };

  const handleInputValveChange = async() => {
    setInputValve(!inputValve);
    checkMonthlyGoal();
    try {
      const response = await axios.post(`/api/user/hardware/send-output-valve`, {
        userId: user?._id,
        string: `inputValve${!inputValve}`
      });
    } catch (error) {
      console.log(error);
    }
  };

  const handleMotorPumpChange = async() => {
    setMotorPump(!motorPump);
    checkMonthlyGoal();
    try {
      const response = await axios.post(`/api/user/hardware/send-motor-pump`, {
        userId: user?._id,
        string: `motorPump${!motorPump}`
      });
    } catch (error) {
      console.log(error);
    }
  };

  const handleBillGoalChange = (value) => {
    setMonthlyBillGoal(value);
    checkMonthlyGoal();
  };

  const checkMonthlyGoal = () => {
    const totalUsage = calculateTotalUsage();
    if (totalUsage > monthlyBillGoal) {
      notifyExceedGoal(totalUsage);
    }
  };

  const calculateTotalUsage = () => {
    // Implement the logic to calculate total monthly usage based on your data
    return 0; // Replace with actual calculation
  };

  const notifyExceedGoal = (totalUsage) => {
    notification.error({
      message: "Monthly Bill Exceeded!",
      description: `Your monthly bill goal of $${monthlyBillGoal} has been exceeded. Current total usage: $${totalUsage}.`,
    });
  };

  return (
    <Layout>
      <h1 className="page-title">Control Panel</h1>
      <div className="card-container">
        <Card className="card">
          <Row gutter={16} className="switch-container">
            <Col span={24}>
              <h2 className="switch-label">Output Valve</h2>
              <Switch
                checked={outputValve}
                onChange={handleOutputValveChange}
              />
              <div className="status-icon">
                {outputValve ? (
                  <CheckCircleTwoTone twoToneColor="#52c41a" />
                ) : (
                  <CloseCircleTwoTone twoToneColor="#eb2f96" />
                )}
                <span className="status-text">
                  {outputValve ? "On" : "Off"}
                </span>
              </div>
            </Col>
            <Col span={24}>
              <h2 className="switch-label">Input Valve</h2>
              <Switch checked={inputValve} onChange={handleInputValveChange} />
              <div className="status-icon">
                {inputValve ? (
                  <CheckCircleTwoTone twoToneColor="#52c41a" />
                ) : (
                  <CloseCircleTwoTone twoToneColor="#eb2f96" />
                )}
                <span className="status-text">{inputValve ? "On" : "Off"}</span>
              </div>
            </Col>
          </Row>
          <div className="button-container">
            <Button
              type="primary"
              className="button-primary"
              onClick={() => alert("Start Manual Operation")}
            >
              Start Manual Operation
            </Button>
          </div>
        </Card>

        <Card className="card">
          <Row gutter={16} className="switch-container">
            <Col span={24}>
              <h2 className="switch-label">Motor Pump</h2>
              <Switch checked={motorPump} onChange={handleMotorPumpChange} />
              <div className="status-icon">
                {motorPump ? (
                  <CheckCircleTwoTone twoToneColor="#52c41a" />
                ) : (
                  <CloseCircleTwoTone twoToneColor="#eb2f96" />
                )}
                <span className="status-text">{motorPump ? "On" : "Off"}</span>
              </div>
            </Col>
          </Row>

          <div>
            <br />
            <h2 className="status-label">Monthly Bill Goal</h2>
            <InputNumber
              min={1}
              max={1000}
              defaultValue={monthlyBillGoal}
              onChange={handleBillGoalChange}
            />
          </div>
          <div className="button-container">
            <Button
              type="primary"
              className="button-primary"
              onClick={() => alert("Start Manual Operation")}
            >
              Start Manual Operation
            </Button>
          </div>
        </Card>
      </div>
      <Card className="status-card">
        <h2 className="status-label">Device Status</h2>
        <br></br>
        <Row gutter={32} justify="center" align="middle">
          <Col span={6}>
            <h3 className="switch-label">Water Level Sensor</h3>
            <div className="status-icon">
              {waterLevelSensor ? (
                <CheckCircleTwoTone twoToneColor="#52c41a" />
              ) : (
                <CloseCircleTwoTone twoToneColor="#eb2f96" />
              )}
              <span className="status-text">
                {waterLevelSensor ? "Working" : "Not Working"}
              </span>
            </div>
          </Col>
          <Col span={6}>
            <h3 className="switch-label">Inlet Valve</h3>
            <div className="status-icon">
              {inletValve ? (
                <CheckCircleTwoTone twoToneColor="#52c41a" />
              ) : (
                <CloseCircleTwoTone twoToneColor="#eb2f96" />
              )}
              <span className="status-text">
                {inletValve ? "Working" : "Not Working"}
              </span>
            </div>
          </Col>
          <Col span={6}>
            <h3 className="switch-label">Outlet Valve</h3>
            <div className="status-icon">
              {outletValve ? (
                <CheckCircleTwoTone twoToneColor="#52c41a" />
              ) : (
                <CloseCircleTwoTone twoToneColor="#eb2f96" />
              )}
              <span className="status-text">
                {outletValve ? "Working" : "Not Working"}
              </span>
            </div>
          </Col>
          <Col span={6}>
            <h3 className="switch-label">Motor Pump</h3>
            <div className="status-icon">
              {outletValve ? (
                <CheckCircleTwoTone twoToneColor="#52c41a" />
              ) : (
                <CloseCircleTwoTone twoToneColor="#eb2f96" />
              )}
              <span className="status-text">
                {outletValve ? "Working" : "Not Working"}
              </span>
            </div>
          </Col>
        </Row>
      </Card>
    </Layout>
  );
}
