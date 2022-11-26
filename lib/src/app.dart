import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigma_app/src/root.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sigma',
      theme: ThemeData(
        
        appBarTheme: AppBarTheme(
          elevation: 5.0,
          backgroundColor: Colors.white,
          shadowColor: Colors.black45,
          titleTextStyle: GoogleFonts.josefinSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: TextTheme(
          button: GoogleFonts.josefinSans(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Root(),
    );
  }
}
