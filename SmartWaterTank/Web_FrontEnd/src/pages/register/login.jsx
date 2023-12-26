import React from "react";
import "./login.css";

export default function Login() {
  return (
    <div className="main">
      <section className="vh-100 bg-image">
        <div className="mask d-flex align-items-center h-100 gradient-custom-3">
          <div className="container h-100">
            <div className="row d-flex justify-content-center align-items-center h-100">
              <div className="col-12 col-md-9 col-lg-7 col-xl-5">
                <div className="card" style={{ borderRadius: '15px', height: '450px', width : '450px'}}>
                  <div className="card-body p-5">
                    <h2 className="text-uppercase text-center mb-3">
                      Login
                    </h2>

                    <form>
                      <div className="mb-1">
                        <label className="form-label" htmlFor="form3Example3cg">
                          Email
                        </label>
                        <input
                          type="email"
                          id="form3Example3cg"
                          className="form-control form-control-lg"
                        />
                      </div>

                      <div className="mb-1">
                        <label className="form-label" htmlFor="form3Example4cg">
                          Password
                        </label>
                        <input
                          type="password"
                          id="form3Example4cg"
                          className="form-control form-control-lg"
                        />
                      </div>

                     
                      <div className="form-check mb-4">
                        <input
                          className="form-check-input"
                          type="checkbox"
                          value=""
                          id="form2Example3cg"
                        />
                        <label
                          className="form-check-label"
                          htmlFor="form2Example3g"
                        >
                          I agree to all statements in{" "}
                          <a href="#!" className="text-body">
                            <u>Terms of service</u>
                          </a>
                        </label>
                      </div>

                      <div className="d-grid">
                        <button
                          type="button"
                          className="btn btn-lg gradient-custom-4"
                          style={{ color: 'white !important' }}
                        >
                          Login
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
