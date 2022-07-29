import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summer_limonad/pages/home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        textTheme: GoogleFonts.marmeladTextTheme(Theme.of(context).textTheme),
      ),
      home: const MyHomePage(),
    );
  }
}
