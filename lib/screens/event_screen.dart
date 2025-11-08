import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {"title": "Fan Meet", "image": "assets/images/bts_event.jpg"},
    {"title": "Live Concert", "image": "assets/images/bts_booking_bg.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(title: Text("BTS Events"), backgroundColor: Colors.purple),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/slots', arguments: events[index]['title']),
            child: Card(
              margin: EdgeInsets.all(15),
              elevation: 6,
              child: Column(
                children: [
                  Image.asset(events[index]['image']!, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      events[index]['title']!,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple[800]),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
