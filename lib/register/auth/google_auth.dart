import 'package:firebase_auth/firebase_auth.dart';
import 'package:flows/mainPage/log_bloc/click_log_bloc.dart';
import 'package:flows/mainPage/saldo_bloc/saldo_bloc.dart';
import 'package:flows/mainPage/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  Future<void> signInAndSignUp(void Function(BuildContext, String) pesan, BuildContext context) async {
    if(FirebaseAuth.instance.currentUser == null) {
      try {
        GoogleSignInAccount? akun = await GoogleSignIn().signIn();

        if(akun != null) {
          GoogleSignInAuthentication auth = await akun.authentication;
          OAuthCredential credential = GoogleAuthProvider.credential( 
            accessToken: auth.accessToken,
            idToken: auth.idToken
          );

          await FirebaseAuth.instance.signInWithCredential(credential);

          if(context.mounted) {
            Navigator.push(  
              context, 
              MaterialPageRoute(  
                builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => ClickLogBloc(),
                  ),
                  BlocProvider(
                    create: (_) => SaldoBloc(),
                  ),
                ],
                child: const MainPage()
              )
              )
            );
          }
        }
      } on FirebaseAuthException catch (_) {
        if(!context.mounted) return;
        pesan(context, "Ada Kesalahan Saat Masuk");
      }
    }
  }
}