import 'package:firebase_core/firebase_core.dart';
import 'package:flows/mainPage/log_bloc/click_log_bloc.dart';
import 'package:flows/mainPage/saldo_bloc/saldo_bloc.dart';
import 'package:flows/mainPage/ui/main_page.dart';
import 'package:flows/register/auth/auto_auth.dart';
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

  bool login = await AutoAuth().check();
  runApp(MyApp(login: login));
}

class MyApp extends StatelessWidget {
  final bool login;
  final ThemeData themeData = ThemeData(  
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
  );

  MyApp({required this.login, super.key});

  @override
  Widget build(BuildContext context) {
    return (login) ? 
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ClickLogBloc(),
        ),
        BlocProvider(
          create: (_) => SaldoBloc(),
        ),
      ],
      child: MaterialApp(  
        home: const MainPage(),
        theme: themeData,
        debugShowCheckedModeBanner: false,
      )
    ) : 
    BlocProvider(
      create: (context) => LoginPassBloc(),
      child: MaterialApp(  
        home: const LoginPage(),
        theme: themeData,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}