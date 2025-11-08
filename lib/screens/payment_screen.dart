import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final slot = args["slot"];
    final ticketType = args["type"];
    final amount = args["amount"];

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(title: Text("Payment"), backgroundColor: Colors.purple),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Scan QR to Pay ₹$amount for $ticketType", style: TextStyle(fontSize: 18, color: Colors.purple[900])),
            SizedBox(height: 20),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/images/qr_code.png"),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pushNamed(context, '/confirm', arguments: {"slot": slot, "type": ticketType});
                  },
                  child: Text("Paid"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                  child: Text("Not Paid"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
