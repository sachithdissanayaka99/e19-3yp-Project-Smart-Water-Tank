import React, { useEffect, useState } from 'react';
import AuthServices from '../../services/AuthServices';
import Layout from '../../components/layout';
import { Card, Statistic, Row, Col, Progress, Alert } from 'antd';
import { useSelector } from 'react-redux';

export default function UserMaindash() {
  const [tankData, setTankData] = useState(null);
  const { user } = useSelector((state) => state.user);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await AuthServices.getData(); // Adjust this function based on your actual API

        if (response && response.data) {
          setTankData(response.data);
        } else {
          console.error('Invalid API response:', response);
          // Handle the case where the API response is not as expected
        }
      } catch (error) {
        console.error('Error fetching tank data:', error);
        // Handle the error case
      }
    };

    fetchData();
  }, []);

  return (
    <Layout>
      <h1 className='page-title'>Dashboard</h1>

      {user?.isAdministrator ? (
        <Row gutter={16}>
          <Col span={24}>
            <Card>
              <h2>Admin Dashboard Content</h2>
              {/* Add graphical representation of all users and admins */}
              {/* Example: Display total number of users and admins */}
              <Statistic title="Total Users" value={tankData?.totalUsers || 0} />
              <Statistic title="Total Admins" value={tankData?.totalAdmins || 0} />
              {/* Add more statistics or graphs as needed */}
            </Card>
          </Col>
        </Row>
      ) : (
        <Row gutter={16}>
          <Col span={24}>
            <Card>
              <h2>User Dashboard Content</h2>
              {/* Add device status information */}
              {tankData?.deviceStatus ? (
                <div>
                  <h3>Device Status</h3>
                  {tankData.deviceStatus.map((device, index) => (
                    <div key={index}>
                      <p>{`Device ${index + 1}: ${device.status}`}</p>
                      {/* Add more details if available */}
                    </div>
                  ))}
                </div>
              ) : (
                <Alert message="No device status available" type="info" />
              )}
            </Card>
          </Col>
        </Row>
      )}
    </Layout>
  );
}
