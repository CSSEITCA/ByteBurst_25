import './HeroSection.css';
import Navbar from './Navbar';

export default function HeroSection() {
  return (
    <div className="hero-container">
        {/* <div className="support"></div> */}
      <img
        src="/tc.jpg"
        alt="Hero Background"
        className="hero-image"
      />
      <Navbar />
      
    </div>
  );
}
