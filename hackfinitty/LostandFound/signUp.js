
  document.querySelector("form").addEventListener("submit", function(e) {
    e.preventDefault(); // Page reload se roke

    const username = document.getElementById("username").value;
    const email = document.getElementById("email").value;
    const pass = document.getElementById("password").value;
    const confirm = document.getElementById("confirm-password").value;

    if (pass !== confirm) {
      alert("Passwords do not match!");
      return;
    }

    // Local save (Browser memory)
    localStorage.setItem("username", username);
    localStorage.setItem("email", email);
    localStorage.setItem("password", pass); // Don't do this in real apps!

    alert("Sign up successful!");

    // Reset form 
    this.reset();
  });

