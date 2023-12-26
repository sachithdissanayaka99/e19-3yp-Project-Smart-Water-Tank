import React, { useEffect } from 'react';
import AuthServices from '../../services/AuthServices';
import Layout from '../../components/layout';
import { styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid';
import Battery30Icon from '@mui/icons-material/Battery30';
// import { Icon } from '@mui/material/Icon';
import './user_main_dash.css'


const Item = styled(Grid)({
  padding: '20px',
  textAlign: 'center',
  color: 'black',
  height: 200,
  // Add other styles as needed
});

export default function UserMaindash() {


  useEffect(() => {
    const fetchData = () => {
      AuthServices.getData();
    };
    fetchData();
  }, []);

  return (
    <Layout>
<Box>
      <Grid container spacing={2}>
        <Grid item xs={4}>
          <Paper>
          <Item>

          <div className='BannerContainer'>
        <i className="ri-battery-2-line banner_icon"></i>
        <h2 className='Banner'>
          Tank Water Level
        </h2>
        </div>
          </Item>
          </Paper>
        </Grid>
        
        <Grid item xs={4}>
        <Paper>
          <Item className='IO'>
          <h2 className='Banner'> 
              Inlet  
            </h2>
            <h2 className='Banner'>
              Outlet
            </h2>
          </Item>
          </Paper>
        </Grid>
        <Grid item xs={4}>
        <Paper>
          <Item>
          <div className='BannerContainer  '>
          <i className="ri-bill-line banner_icon"></i>
          <h2 className='Banner' >
              Monthly Bill
            </h2>
            </div>
          </Item>
          </Paper>
        </Grid>
        <Grid item xs={4}>
        <Paper>
          <Item>
          <h2 className='Banner'>
              Monthly Water Usage
            </h2>
          </Item>
          </Paper>
        </Grid>
      </Grid>
      </Box>


    </Layout>
  );
}


