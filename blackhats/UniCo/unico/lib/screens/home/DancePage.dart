// Updated version of DancePage and HackathonPage with same app theme but better UI
import 'package:flutter/material.dart';

class DancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dance With Us", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(13, 27, 42, 1.0),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D1B2A), Color(0xFF1B263B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: 'Dance',
                child: Image.asset(
                  'assets/images/DancePage.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            buildCard(
              "\ud83d\udc83 Welcome to the Dance Club",
              "Rhythm Reloaded is MMMUT's official dance crew known for dynamic performances across styles: Hip-Hop, Classical, Contemporary, and more.",
            ),
            buildCard(
              "\ud83c\udf1f Activities",
              "- Weekly sessions with choreographers\n- Freestyle jams and flash mobs\n- Events at Abhyudaya, TechSrijan, and beyond",
            ),
            buildCard(
              "\ud83d\udcdd How to Join",
              "- Attend auditions each semester\n- 1-2 minute solo\n- Judged on rhythm, energy, stage presence",
            ),
            buildCard(
              "\ud83d\udcac Perks",
              "- Represent college on big stages\n- Boost confidence, teamwork\n- Be part of a passionate artist family",
            ),
            buildCard(
              "\ud83d\udccd Contact",
              "Instagram: @rhythmreloaded_mmmut\nAnanya Sharma (CSE 3rd Year)\n+91-98765XXXXX",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.cyanAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// You can reuse the same structure for HackathonPage with content updates.

class HackathonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CodeStorm - Hack Club",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(13, 27, 42, 1.0),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D1B2A), Color(0xFF1B263B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: 'Hackathon',
                child: Image.asset(
                  'assets/images/darkhackathon.webp',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            buildCard(
              "\ud83d\udcbb Welcome to CodeStorm",
              "Official Hack Club of MMMUT focusing on solving real-world problems with tech and innovation.",
            ),
            buildCard(
              "\ud83e\udde0 What We Do",
              "- Host hackathons, bootcamps\n- Workshops on Flutter, MERN, ML\n- Alumni & mentor guidance",
            ),
            buildCard(
              "\ud83d\udccd How to Join",
              "- CodeStorm Challenge every semester\n- R1: Online Coding\n- R2: Idea Pitch\n- Judged on creativity & collaboration",
            ),
            buildCard(
              "\ud83c\udf1f Perks",
              "- National-level hackathon exposure\n- Portfolio & teamwork boost\n- Internship and networking access",
            ),
            buildCard(
              "\ud83d\udcac Contact",
              "GitHub: github.com/codestorm-mmmut\nInstagram: @codestorm_mmmut\nRahul Verma (IT 4th Year)\n+91-98765XXXXX",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
