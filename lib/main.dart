import 'package:flower_bouquet_20_10/screens/home_screen.dart';
import 'package:flower_bouquet_20_10/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.playwriteAuTasTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),

      home: HomeScreen(),
    );
  }
}
