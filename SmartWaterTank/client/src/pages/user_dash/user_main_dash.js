import React, { useEffect } from 'react';
import AuthServices from '../../services/AuthServices';
import Layout from '../../components/layout';
import YouTube from 'react-youtube';
import './styles/user_dash.css';


export default function UserMaindash() {
  useEffect(() => {
    const fetchData = () => {
      AuthServices.getData();
    };
    fetchData();
  }, []);

  
  const youtubeOptions = {
    width: '900', 
    height: '480'
  };

  const youtubeVideoId = 'xKW_JGXT41g'; 

  return (
    <Layout>
      <h1 className='page-title'>User Dashboard</h1>

      <div className='youtube-container'>
        <YouTube videoId={youtubeVideoId} opts={youtubeOptions} />
      </div>
    </Layout>
  );
}
