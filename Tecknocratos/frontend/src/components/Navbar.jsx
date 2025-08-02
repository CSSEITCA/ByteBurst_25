'use client';

import Link from 'next/link';
import Image from 'next/image';
import './navbar.css'; // Adjust path if stored elsewhere

export default function Navbar() {
  return (
    <nav className="navbar">
      <Link href="/" className="navbar-logo">
        <Image src="/logo.png" alt="Logo" width={40} height={40} />
      </Link>

      <div className="navbar-title">Computer Societry Of Software Enginners</div>

      <div className="navbar-links">
        <Link href="/">Home</Link>
        <Link href="/about">About</Link>
        <Link href="/projects">Projects</Link>
        <Link href="/contact">Contact</Link>
        <Link href="/profile" className="navbar-profile">
          <Image src="/profile-icon.png" alt="Profile" width={32} height={32} />
        </Link>

      </div>
    </nav>
  );
}
