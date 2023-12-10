import React, { useState } from 'react';
import '../style/login.css';
import AuthService from '../../services/AuthServices';
import { Link } from 'react-router-dom';
import Validation from './RegisterValidation';
import toast from 'react-hot-toast';
import { useNavigate } from 'react-router-dom';

export default function Register() {
  const navigate = useNavigate();

  const [values, setValues] = useState({
    fullName: '',
    email: '',
    password: '',
    confirmPassword: '',
  });

  const [errors, setErrors] = useState({});

  const handleChange = (event) => {
    setValues((prev) => ({ ...prev, [event.target.name]: event.target.value }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    setErrors((prevErrors) => {
      const newErrors = Validation(values);
      return newErrors;
    });

    if (
      errors.fullName === '' &&
      errors.email === '' &&
      errors.password === '' &&
      errors.confirmPassword === ''
    ) {
      const fullName = values.fullName.toString();
      const email = values.email.toString();
      const password = values.password.toString();

      try {
        const registerResult = await AuthService.register(fullName, email, password);

        if (registerResult === 2) {
          toast.success('Registration successful');
          setTimeout(() => {
            toast('Redirecting to Login page');
            navigate('/login');
          }, 2000);
        } else {
          toast.error(registerResult.message);
        }
      } catch (error) {
        console.error('Register error:', error);
      }
    }
  };

  return (
    <div>
      <section className="vh-100">
        <div className="container py-5 h-100">
          <div className="row d-flex align-items-center justify-content-center h-100">
          <div className="col-md-8 col-lg-7 col-xl-6 img-container">
            <img src="./assets/images/logo.png" className="img-fluid img-3d" alt="" />
          </div>
            <div className="col-md-7 col-lg-4 col-xl-4 offset-xl-1 form_input">
              <form onSubmit={handleSubmit}>
                <div className="form-outline mb-4">
                  <input
                    type="text"
                    id="form1Example1"
                    className="form-control form-control-lg"
                    name="fullName"
                    onChange={handleChange}
                  />
                  <label className="form-label" htmlFor="form1Example1">
                    Full Name
                  </label>
                </div>

                {/* Email input */}
                <div className="form-outline mb-4">
                  <input
                    type="email"
                    id="form1Example2"
                    className="form-control form-control-lg"
                    name="email"
                    onChange={handleChange}
                  />
                  {errors.email}
                  <label className="form-label" htmlFor="form1Example2">
                    Email address
                  </label>
                </div>

                {/* Password input */}
                <div className="form-outline mb-4">
                  <input
                    type="password"
                    id="form1Example3"
                    className="form-control form-control-lg"
                    name="password"
                    onChange={handleChange}
                  />
                  {errors.password}
                  <label className="form-label" htmlFor="form1Example3">
                    Password
                  </label>
                </div>

                <div className="form-outline mb-4">
                  <input
                    type="password"
                    id="form1Example4"
                    className="form-control form-control-lg"
                    name="confirmPassword"
                    onChange={handleChange}
                  />
                  {errors.confirmPassword}
                  <label className="form-label" htmlFor="form1Example4">
                    Confirm Password
                  </label>
                </div>

                <div className="d-flex align-items-right mb-4">
                  <Link to="/login">Already have an account?</Link>
                </div>

                {/* Submit button */}
                <button
                  type="submit"
                  className="btn btn-primary btn-lg btn-block w-100"
                >
                  Sign Up
                </button>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
