// Import Firebase modules
import { initializeApp } from "https://www.gstatic.com/firebasejs/12.0.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/12.0.0/firebase-analytics.js";
import { getAuth, createUserWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/12.0.0/firebase-auth.js";

// Firebase config
const firebaseConfig = {
  apiKey: "AIzaSyDV3BvBAvICbrnm8DC90rrb-_5o2A2v5u8",
  authDomain: "studentlogin-d8962.firebaseapp.com",
  projectId: "studentlogin-d8962",
  storageBucket: "studentlogin-d8962.appspot.com",
  messagingSenderId: "469189587407",
  appId: "1:469189587407:web:aa549fc18230810cfee2ba",
  measurementId: "G-BC2HTD1SNQ"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);

// Handle form submission
const form = document.getElementById('registerForm');
form.addEventListener('submit', async (event) => {
  event.preventDefault();

  const emailInput = document.getElementById('email');
  const passwordInput = document.getElementById('password');
  const email = emailInput.value.trim();
  const password = passwordInput.value;

  // Clear previous messages
  document.getElementById('emailError').textContent = '';
  document.getElementById('passwordError').textContent = '';
  document.getElementById('successMsg').textContent = '';

  let valid = true;

  // Basic validations
  if (!email) {
    document.getElementById('emailError').textContent = 'Email is required.';
    valid = false;
  } else if (!/^\S+@\S+\.\S+$/.test(email)) {
    document.getElementById('emailError').textContent = 'Enter a valid email.';
    valid = false;
  }

  if (!password) {
    document.getElementById('passwordError').textContent = 'Password is required.';
    valid = false;
  } else if (password.length < 6) {
    document.getElementById('passwordError').textContent = 'Password must be at least 6 characters.';
    valid = false;
  }

  if (!valid) return;

  // Firebase create user
  try {
    const userCredential = await createUserWithEmailAndPassword(auth, email, password);
    document.getElementById('successMsg').textContent = "Account created successfully!";
    form.reset();
    setTimeout(() => {
      window.location.href = "home.html";
    }, 1500);
  } catch (error) {
    alert("Firebase Error: " + error.message);
  }
});
