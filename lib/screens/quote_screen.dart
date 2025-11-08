import 'package:flutter/material.dart';

class QuoteScreen extends StatelessWidget {
  final List<String> quotes = [
    "💜 RM: 'Teamwork makes the dream work.'",
    "💜 Jin: 'Your presence can give happiness.'",
    "💜 Suga: 'Effort makes you. You will regret someday if you don’t do your best now.'",
    "💜 J-Hope: 'If you don’t work hard, there won’t be good results.'",
    "💜 Jimin: 'Go on your path, even if you live for a day.'",
    "💜 V: 'Don’t be trapped in someone else’s dream.'",
    "💜 Jungkook: 'Effort makes you. You will regret someday if you don’t do your best now.'",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(title: Text("BTS Quotes 💜"), backgroundColor: Colors.purple),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(quotes[index], style: TextStyle(color: Colors.purple[900], fontSize: 16)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "We are eagerly waiting to see you in India 💜",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple[800]),
            ),
          ),
        ],
      ),
    );
  }
}
