import React, { useEffect } from 'react';
import AuthServices from '../../services/AuthServices';
import Layout from '../../components/layout';

export default function AdminMainDash() {


  useEffect(() => {
    const fetchData = () => {
      AuthServices.getData();
    };
    fetchData();
  }, []);

  return (
    <Layout>
      <h1 className='page-title'>Admin Dashboard</h1> 
    </Layout>
  );
}
