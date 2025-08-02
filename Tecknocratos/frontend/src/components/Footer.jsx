import './footer.css';

export default function Footer() {
  return (
    <footer className="footer">
      <div className="copyright">
        ©Copyright <span style={{fontWeight: 'bold'}}>Computer Society Of Software Engineers</span> | All rights reserved |
      </div>
      <div className="love">
        Designed with ❤️ by <span style={{fontWeight: 'bold'}}>Computer Society Of Software Engineers, MMMUT</span>
      </div>
    </footer>
  );
}