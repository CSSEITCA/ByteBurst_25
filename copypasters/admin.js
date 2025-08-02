window.onload = () => {
  const data = JSON.parse(localStorage.getItem("registrations")) || [];
  const tableDiv = document.getElementById("registration-table");
  const entryCount = document.getElementById("entry-count");
  const progressBar = document.getElementById("progress-bar-fill");

  updateDisplay(data);

  function updateDisplay(dataArray) {
    tableDiv.innerHTML = "";
    entryCount.textContent = dataArray.length;
    progressBar.style.width = Math.min(dataArray.length * 10, 100) + "%";

    if (dataArray.length === 0) {
      tableDiv.innerHTML = "<p>No registrations yet.</p>";
      return;
    }

    let grouped = {};

    // Group by event
    dataArray.forEach((entry, index) => {
      if (!grouped[entry.event]) grouped[entry.event] = [];
      grouped[entry.event].push({ ...entry, index });
    });

    for (let event in grouped) {
      const section = document.createElement("div");
      section.innerHTML = `
        <h3 style="margin-top:30px">${event}</h3>
        <table class="data-table">
          <tr>
            <th>Name</th>
            <th>Branch</th>
             <th>Event</th>
            <th>Roll No</th>
            <th>Contact</th>
            <th>Team Name</th>
            <th>Team Members</th>
            <th>Time</th>
            <th>Action</th>
          </tr>
          ${grouped[event]
            .map(
              (entry, i) => `
              <tr>
                <td>${entry.name}</td>
                <td>${entry.branch}</td>
                 <td>${entry.Event}</td>
                <td>${entry.rollno}</td>
                <td>${entry.contact}</td>
                <td>${entry.teamname}</td>
                <td>${entry.participants}</td>
                <td>${entry.time}</td>
                <td><button class="delete-btn" onclick="deleteEntry(${entry.index})">Delete</button></td>
              </tr>`
            )
            .join("")}
        </table>`;
      tableDiv.appendChild(section);
    }
  }

  // Make deleteEntry available globally
  window.deleteEntry = (index) => {
    const updated = [...data];
    updated.splice(index, 1);
    localStorage.setItem("registrations", JSON.stringify(updated));
    updateDisplay(updated);
  };
};

