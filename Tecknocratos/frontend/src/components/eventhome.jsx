// components/EventHome.jsx
import './eventhome.css'; // optional CSS file

export default function EventHome() {
    const events = [
        { id: 1, title: "Bug Buster", date: "01 August 2025", description: "Put your debugging skills to the test in Bug Buster, the ultimate bug-hunting showdown! Dive into messy codebases, uncover hidden bugs, and compete to fix issues faster than your peers. Ideal for those with a keen eye for detail and a love for clean, error-free code." },

        { id: 2, title: "Byte Burst", date: "02 August 2025", description: "Unleash your coding potential in ByteBurst, an intensive hackathon where innovation meets execution. Participants will tackle real-world problems and develop creative solutions in a time-bound challenge. Whether you’re building apps, tools, or platforms—this is your stage to shine, collaborate, and push the boundaries of what's possible." },

        { id: 3, title: "Extempore", date: "02 Aug 2025", description: "Step up, speak out! Extempore challenges your spontaneity and clarity of thought as you present on a random topic with minimal prep time. Showcase your communication skills, confidence, and presence of mind in this exciting test of on-the-spot thinking." },
    ];

    return (
        <div className="event-section">
            <h2 className="event-heading">Upcoming Events</h2>
            <div className="event-list">
                {events.map((event) => (
                    <div className="event-card">
                        <h3 className="event-title">{event.title}</h3>
                        <span className="event-date">{event.date}</span>
                        <p className="event-description">{event.description}</p>
                    </div>
                ))}
            </div>
        </div>
    );
}
