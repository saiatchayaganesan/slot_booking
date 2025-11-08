import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/slot_provider.dart';
import 'providers/booking_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/event_screen.dart';
import 'screens/slot_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/confirm_screen.dart';
import 'screens/quote_screen.dart';

void main() {
  runApp(const BTSApp());
}

class BTSApp extends StatelessWidget {
  const BTSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SlotProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BTS Concert Booking",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Roboto',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeScreen(),
          '/events': (context) => EventScreen(),
          '/slots': (context) => SlotScreen(),
          '/payment': (context) => PaymentScreen(),
          '/confirm': (context) => ConfirmScreen(),
          '/quotes': (context) => QuoteScreen(),
        },
      ),
    );
  }
}
