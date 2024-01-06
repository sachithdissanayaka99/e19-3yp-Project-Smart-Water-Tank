import React, { useState, useEffect } from 'react';
import {QrReader} from 'react-qr-reader';
import Layout from '../../components/layout';
import './styles/control.css';

export default function Control() {
  const [waterLevel, setWaterLevel] = useState(30);
  const [inletSwitch, setInletSwitch] = useState(false);
  const [showConnectForm, setShowConnectForm] = useState(false);
  const [scanQR, setScanQR] = useState(false);
  const [tankID, setTankID] = useState('');
  const [isTankConnected, setIsTankConnected] = useState(false);

  const fetchWaterLevel = async () => {
    try {
      const response = await fetch('your_backend_api_endpoint');
      const data = await response.json();
      setWaterLevel(data.waterLevel);
    } catch (error) {
      console.error('Error fetching water level:', error);
    }
  };

  const toggleInletSwitch = () => {
    setInletSwitch(!inletSwitch);
  };

  const handleQRCodeScan = (data) => {
    if (data) {
     
      console.log('Scanned QR Code:', data);
      setScanQR(false);
    }
  };

  const handleConnectFormSubmit = (e) => {
    e.preventDefault();

    
    console.log('Tank connected with ID:', tankID);

    setTankID('');
    setShowConnectForm(false);
    setIsTankConnected(true); 
  };

  useEffect(() => {
    fetchWaterLevel();
  }, []);

  return (
    <Layout>
      <div className="control-container">
        <h1 className='page-title'>Water Tank Control</h1>
        {isTankConnected ? (
          <>
            <div className="tank-container">
              <div className="tank">
                <div className="water" style={{ height: `${(waterLevel / 100) * 100}%` }}></div>
              </div>
            </div>
            <div className="info-section">
              <p className="info">Current Water Level: {waterLevel !== null ? `${waterLevel} %` : 'Loading...'}</p>
            </div>
            <div className="switch-section">
              <p className="info">Inlet Control:</p>
              <label className="switch">
                <input type="checkbox" checked={inletSwitch} onChange={toggleInletSwitch} />
                <span className="slider"></span>
              </label>
            </div>
          </>
        ) : (
          <div className="connect-form">
            {showConnectForm ? (
              <>
                <form onSubmit={handleConnectFormSubmit}>
                  <label htmlFor="tankID">Enter Tank ID:</label>
                  <input
                    type="text"
                    id="tankID"
                    value={tankID}
                    onChange={(e) => setTankID(e.target.value)}
                  />
                  <button type="submit">Connect Tank</button>
                </form>
                <br/>
                <button onClick={() => setScanQR(true)}>Scan QR Code</button>
              </>
            ) : (
              <>
                <p className="info">No tank connected. Connect your tank using:</p>
                <button onClick={() => setShowConnectForm(true)}>Enter Tank ID</button>
                <button onClick={() => setScanQR(true)}>Scan QR Code</button>
              </>
            )}
            {scanQR && (
              <div className="qr-scanner">
                <QrReader
                  delay={300}
                  onError={(err) => console.error(err)}
                  onScan={handleQRCodeScan}
                  style={{ width: '100%' }}
                />
                <button onClick={() => setScanQR(false)}>Cancel Scan</button>
              </div>
            )}
          </div>
        )}
      </div>
    </Layout>
  );
}














