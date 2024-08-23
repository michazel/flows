import 'package:firebase_auth/firebase_auth.dart';
import 'package:flows/mainPage/main_page.dart';
import 'package:flutter/material.dart';
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

          FirebaseAuth.instance.signInWithCredential(credential);

          if(context.mounted) {
            Navigator.push(  
              context, 
              MaterialPageRoute(  
                builder: (context) => const MainPage()
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