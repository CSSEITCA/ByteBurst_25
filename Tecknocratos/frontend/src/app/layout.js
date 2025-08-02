import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import Support from "@/components/Support"; // Importing Support component

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata = {
  title: 'Technocratos',
  description: 'Landing page for the MERN project',
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <Navbar />   {/* ✅ This shows on every page */}
        <Support /> {/* ✅ This shows on every page */}
        <main style={{ flex: 1 }}>

          {children}
        </main>
        <Footer />   {/* ✅ This shows on every page */}
      </body>
    </html>
  );
}