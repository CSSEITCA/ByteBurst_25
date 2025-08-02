import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsRef = FirebaseFirestore.instance.collection("events");

    return Scaffold(
      appBar: AppBar(title: const Text("Upcoming Events")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 169, 213, 247),
        child: StreamBuilder(
          stream: eventsRef.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
        
            final events = snapshot.data!.docs;
        
            if (events.isEmpty) {
              return Center(child: Image.asset("assets/images/no_events.png"));
            }
        
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (_, index) {
                final event = events[index].data();
                return Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset(event['image'], width: 64),
                  
                    title: Text(event['title']),
                    subtitle: Text(event['description']),
                    trailing: Text(event['date']),
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