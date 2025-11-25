import 'package:flutter/material.dart';
import 'screens/donation_screen.dart';

void main() {
  runApp(const DonationApp());
}

class DonationApp extends StatelessWidget {
  const DonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fredirck Sseruyange Foundation',
      theme: ThemeData(
        primaryColor: const Color(0xFF0d6efd),
        scaffoldBackgroundColor: const Color(0xFFf4f7fb),
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0d6efd),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const DonationScreen(),
    );
  }
}