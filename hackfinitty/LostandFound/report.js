
  document.addEventListener("DOMContentLoaded", function () {
    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

    if (!SpeechRecognition) {
      alert("Speech Recognition not supported in this browser.");
      return;
    }

    const recognition = new SpeechRecognition();
    recognition.lang = 'en-US';
    recognition.interimResults = false;

    let currentTarget = null;
    
    document.querySelectorAll(".mic-btn").forEach(button => {
      button.addEventListener("click", () => {
        const parentForm = button.closest("form");
        const targetName = button.dataset.target;
        const targetInput = parentForm.querySelector(`[name="${targetName}"]`);

        if (!targetInput) return;

        currentTarget = targetInput;
        recognition.start();
      });
    });

    recognition.addEventListener("result", (event) => {
      const transcript = event.results[0][0].transcript;
      if (currentTarget.tagName === "TEXTAREA") {
        currentTarget.value += " " + transcript;
      } else {
        currentTarget.value = transcript;
      }
    });

    recognition.addEventListener("end", () => {
      currentTarget = null;
    });
  });

