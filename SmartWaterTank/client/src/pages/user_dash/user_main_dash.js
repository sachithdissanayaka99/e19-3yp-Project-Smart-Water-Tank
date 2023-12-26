import React, { useEffect } from 'react';
import AuthServices from '../../services/AuthServices';
import Layout from '../../components/layout';

export default function UserMaindash() {


  useEffect(() => {
    const fetchData = () => {
      AuthServices.getData();
    };
    fetchData();
  }, []);

  return (
    <Layout>
      <h1>user main dash</h1> 
    </Layout>
  );
}
