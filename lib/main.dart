import 'package:flutter/material.dart';
import 'package:parez_fodd/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ParezFoddApp());
}

class ParezFoddApp extends StatelessWidget {
  const ParezFoddApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parez Fodd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}