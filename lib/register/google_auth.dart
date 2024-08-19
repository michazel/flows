import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  void signInAndSignUp(void Function(BuildContext, String) pesan, BuildContext context) async {
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
        }
      } on FirebaseAuthException catch (_) {
        if(!context.mounted) return null;
        pesan(context, "Ada Kesalahan Saat Masuk");
      }
    }
  }
}