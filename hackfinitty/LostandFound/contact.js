// Initialize EmailJS with your public key
(function () {
  emailjs.init("FHThQH_4EDTS-BUlY"); // Replace with your EmailJS public key
})();

// Handle form submit
document.getElementById("contact-form").addEventListener("submit", function (e) {
  e.preventDefault();

  emailjs.sendForm("service_2gvy7iq", "template_fg36y2c", this)
    .then(function () {
      alert("Message sent successfully!");
      document.getElementById("contact-form").reset();
    }, function (error) {
      alert("Failed to send message. Please try again.\n" + error);
    });
});