import 'package:bwa_cozy/pages/splash_page.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(),
              scaffoldBackgroundColor: Colors.white),
          home: const SplashPage()),
    );
  }
}
