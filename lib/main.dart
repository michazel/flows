import 'package:firebase_core/firebase_core.dart';
import 'package:flows/register/login_bloc/login_pass_bloc.dart';
import 'package:flows/register/ui/login_page.dart';
import 'package:flows/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => LoginPassBloc(),
      child: MaterialApp(  
        home: const LoginPage(),
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
      ),
    );
  }
}