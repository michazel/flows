import 'package:firebase_core/firebase_core.dart';
import 'package:flows/mainPage/main_page.dart';
import 'package:flows/register/login_page.dart';
import 'package:flows/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      home: const MainPage(),
      theme: ThemeData(  
        textTheme: GoogleFonts.robotoCondensedTextTheme().copyWith(
          bodyLarge: GoogleFonts.roboto(  
            fontSize: 26,
          ),
          bodyMedium: GoogleFonts.roboto(  
            fontSize: 18
          ),
          bodySmall: GoogleFonts.roboto(  
            fontSize: 16
          )
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}