import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Home from './pages/home/Home';
import Register from './pages/register/Register';
import 'bootstrap/dist/css/bootstrap.min.css';
import Footer from './components/Footer';
import Header from './components/Header';

function App() {
  return (
    <BrowserRouter>
      <Header />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/register" element={<Register />} />
      </Routes>
      <Footer />
    </BrowserRouter>
  );
}

export default App;
