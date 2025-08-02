import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unico_app/screens/home/about.dart';
import '../auth/login_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';
import 'events_screen.dart'; // You’ll create this in Phase 3
import 'groups_screen.dart'; // You’ll create this in Phase 3
import 'chat_user_list_screen.dart';
import '../../models/user_model.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(247, 2, 64, 125),
        title: const Text("UniCo Dashboard"),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _logout(context))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 8, 123, 210),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(
              context,
              title: "Profile",
              image: "assets/images/profile_icon.png",
              
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              ),
            ),
            _buildCard(
              context,
              title: "Chat",
              image: "assets/images/chat_icon.png",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatScreen( currentUserId: FirebaseAuth.instance.currentUser!.uid,
        otherUser: UserModel(
          uid: 'sampleID123',
          name: 'Sample User',
          email: 'sample@email.com',
          department: "cse",
          interests: ["Coding"]
        ),)),
              ),
            ),
            _buildCard(
              context,
              title: "Events",
              image: "assets/images/events_icon.png",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EventsScreen()),
              ),
            ),
            _buildCard(
              context,
              title: "Groups",
              image: "assets/images/groups_icon.png",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GroupsScreen()),
              ),
            ),
            _buildCard(
              context,
              title: "Upcoming...",
              image: "assets/images/chat_icon.png",
              onTap: () =>Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatUserListScreen(currentUserId: FirebaseAuth.instance.currentUser!.uid),
          ),
        )
        
            ),
            SizedBox(height: 100,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FoundersPage()),);
              },
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: 
                  EdgeInsets.all(10),
                  child:Text("Founders", style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),),)
                  
                ],
              ),
            )
          
        
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title, required String image, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        color: Color.fromARGB(226, 191, 226, 103),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 64),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}