import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'DancePage.dart';
import 'quiz.dart';
final Map<String, Widget Function()> groupNavigationMap = {
  'dance': () => DancePage(),
  'music': () => MusicPage(),
  'quiz': () => QuizPage(),
  'hack': () => HackathonPage(),
};

class GroupsScreen extends StatelessWidget {

  const GroupsScreen({super.key});
  
  

  @override
  Widget build(BuildContext context) {

    final groupsRef = FirebaseFirestore.instance.collection("groups");

    return Scaffold(
      appBar: AppBar(title: const Text("Campus Groups")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 253, 238, 192),
        child: StreamBuilder(
          stream: groupsRef.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
        
            final groups = snapshot.data!.docs;
        
            if (groups.isEmpty) {
              return Center(child: Image.asset("assets/images/no_groups.png"),);
            }
        
            return ListView.builder(
              itemCount: groups.length,
              itemBuilder: (_, index) {
                final group = groups[index].data();
                 final navKey = group['nav'];
                return Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 3,
                  child: ListTile(
                    leading: Image.asset(group['img'], width: 64),
                    title: Text(group['name'] ?? "null"),
                    subtitle: Text(group['description'] ?? "null"),
                    trailing: ElevatedButton(
                      onPressed: () {
          // Show "Joined {group name}" snackbar first
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Joined ${group['name']}')),
        
          );
        
          // Then navigate after a short delay (so the snackbar is visible briefly)
          Future.delayed(const Duration(milliseconds: 500), () {
            if (groupNavigationMap.containsKey(navKey)) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => groupNavigationMap[navKey]!(),
          ),
        );
            } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No screen mapped for "$navKey"')),
        );
            }
          });
        },
        
                      child: const Text("Join"),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}