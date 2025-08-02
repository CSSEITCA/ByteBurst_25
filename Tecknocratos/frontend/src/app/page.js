'use client'; // only if using App Router

import { useEffect, useState } from "react";
import axios from 'axios';
import HeroSection from "@/components/HeroSection";
import Notice from "@/components/Notice";
import Update from "@/components/Update";
import './home.css';
import Support from "@/components/Support"; // Importing Support component
import EventHome from "@/components/eventhome"; // adjust the path if needed



export default function Home() {


  return (
    <main>
    <Support />
      <HeroSection />
      <div className="flex-container">
        <div className="flex-item notice-section">
          <div className="notice-overlay">NOTICES</div>
          <Notice />
        </div>
        <div className="flex-item update-section">
          <div className="update-overlay">LIVE UPDATES</div>
          {/* <img src="/update.jpg" alt="Update Background" className="update-image" /> */}
          <Update />
        </div>
      </div>

          <EventHome />


    </main>
  );
}
