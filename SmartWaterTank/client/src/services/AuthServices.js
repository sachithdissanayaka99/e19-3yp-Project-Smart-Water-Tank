// AuthService.js
import axios from 'axios';


const register = async (fullName, email, password) => {
  
  try {
    const response = await axios.post('http://localhost:8081/register', {
      fullName,
      email,
      password,
    })


      
      return response.data.serverStatus;
// You might want to return some data from the response
  } catch (error) {
    // Handle errors
    console.error('Registration failed:', error);
    throw error; // Rethrow the error to let the component handle it
  }
};

const login = async (email, password) => {
  try {
    const response = await axios.post('api/user/login', {
      email,
      password,
    });

    // Check if the response status is successful (e.g., 200 OK)
    if (response.status === 200) {
      console.log('Login successful:', response.data);
      return response.data;
    } else {
      // Handle other status codes (e.g., 401 Unauthorized)
      console.error('Login failed:', response.status, response.data);
      throw new Error('Login failed');
    }
  } catch (error) {
    // Handle network errors or other exceptions
    console.error('Login failed:', error.message);
    throw error;
  }
};


export default {
  register,
  login,
};
