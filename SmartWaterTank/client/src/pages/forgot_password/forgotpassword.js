import React from 'react';
import '../style/login.css';

export default function ForgotPassword() {
  const onSubmit = (event) => {
    event.preventDefault();
    const email = event.target.email.value;

    console.log('Email address for password reset:', email);
  };

  return (
    <div>
      <section className="vh-100">
        <div className="container py-5 h-100">
          <div className="row d-flex align-items-center justify-content-center h-100">
            <div className="col-md-8 col-lg-7 col-xl-6">
              <img src="./assets/images/logo.png" className="img-fluid" alt="" />
            </div>
            <div className="col-md-7 col-lg-4 col-xl-4 offset-xl-1 form_input">
              <form onSubmit={onSubmit}>
                {/* Email input */}
                <div className="form-outline mb-4">
                  <input
                    type="email"
                    id="form1Example13"
                    className="form-control form-control-lg"
                    name="email"
                  />
                  <label className="form-label" htmlFor="form1Example13">
                    Email address
                  </label>
                </div>

                {/* Submit button */}
                <button
                  type="submit"
                  className="btn btn-primary btn-lg btn-block w-100"
                >
                  Submit
                </button>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
