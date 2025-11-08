import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final slot = args["slot"];
    final ticketType = args["type"];

    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/success.json', height: 180),
            Text(
              "Booking Confirmed!",
              style: TextStyle(fontSize: 24, color: Colors.purple[900], fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Event: $ticketType"),
            Text("City: ${slot.city}"),
            Text("Date: ${slot.startTime.day}/${slot.startTime.month}/${slot.startTime.year}"),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () => Navigator.pushReplacementNamed(context, '/quotes'),
              child: Text("View BTS Quotes"),
            ),
          ],
        ),
      ),
    );
  }
}
