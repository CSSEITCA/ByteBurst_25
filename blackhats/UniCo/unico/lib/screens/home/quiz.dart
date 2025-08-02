import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Arena", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 27, 42, 1.0),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 1, 1, 29),
              Color.fromRGBO(13, 27, 42, 1.0)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: 'Quiz',
                child: Image.asset('assets/images/quizhighlight.jpg', height: 200, fit: BoxFit.cover)),
            ),
             
           
            
            buildGlassCard(
              '🧠 Welcome to Quiz Arena',
              '''• The official MMMUT quiz club.
• Sharpens intellect through weekly quiz battles.
• Specializes in tech, current affairs, mythology, literature and pop culture.''',
            ),
            buildGlassCard(
              '🎓 What We Do',
              '''• Conduct intra-college and open quizzes.
• Collaborate with fests like TechSrijan & Abhyudaya.
• Invite quizmasters and alumni for themed rounds.''',
            ),
            buildGlassCard(
              '📝 How to Join',
              '''• Attend club orientation and participate in a trial quiz.
• Selection based on:
  • Accuracy
  • Logical Thinking
  • Time Management.''',
            ),
            buildGlassCard(
              '🎯 Perks',
              '''• Represent MMMUT in inter-college quiz tournaments.
• Develop confidence, speed, and clarity of thought.
• Network with intellectual minds.''',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGlassCard(String title, String content) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.95)),
          ),
        ],
      ),
    );
  }
}

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SoundScape", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(13, 27, 42, 1.0),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 1, 1, 29),
              Color.fromRGBO(13, 27, 42, 1.0)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
             ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: 'Music',
                child: Image.asset('assets/images/musichighlight.jpg', height: 200, fit: BoxFit.cover)),
            ),
             
            buildGlassCard(
              '🎵 Welcome to SoundScape',
              '''• MMMUT’s official music club.
• From classical ragas to indie rock, we cover it all.
• Hosts concerts, unplugged nights, and competitions.''',
            ),
            buildGlassCard(
              '🎙️ What We Do',
              '''• Weekly jam sessions and vocal training.
• Collaborate with dance & drama clubs for fusion acts.
• Promote original compositions and remixes.''',
            ),
            buildGlassCard(
              '📝 How to Join',
              '''• Attend auditions at the start of each semester.
• Perform 1-2 minute piece (vocals or instrument).
• Judged on:
  • Voice/instrument control
  • Feel and energy
  • Harmony & range.''',
            ),
            buildGlassCard(
              '🎯 Perks',
              '''• Perform live on big stages like Abhyudaya.
• Record your own songs and collaborate.
• Grow your network in the music community.''',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGlassCard(String title, String content) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.95)),
          ),
        ],
      ),
    );
  }
}
