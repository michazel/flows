import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailAuth {
  final String email;
  final String password;

  const EmailAuth({required this.email, required this.password});

  void signIn(void Function(BuildContext, String) pesan, BuildContext context) async {
    if(FirebaseAuth.instance.currentUser == null) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, 
          password: password
        );
        if(!context.mounted) return;
        pesan(context, "Berasil Login");
      } on FirebaseAuthException catch (_) {
        if(!context.mounted) return;
        pesan(context, "Ada kesalahan Saat Login");
      }
    } else {
      pesan(context, "Silahkan logout dulu dari akun anda");
    }
  }

  void signUp(void Function(BuildContext, String) pesan, BuildContext context) async {
    if(FirebaseAuth.instance.currentUser == null) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Timer? timer;

        timer = Timer(const Duration(minutes: 2), () {
          pesan(context, "Email belum diverifikasi dalam 2 menit.");
          FirebaseAuth.instance.currentUser!.delete();
          timer!.cancel();
        });

        Timer.periodic(const Duration(seconds: 5), (poltime) async {
          await FirebaseAuth.instance.currentUser!.reload();

          if(FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
            timer!.cancel();
            poltime.cancel();
          } else {
            if(!timer!.isActive) return;
            if(!context.mounted) return;
            pesan(context, "Menunggu Verifikasi Email");
          }
        });
      } on FirebaseAuthException catch (_) {
        if(!context.mounted) return;
        pesan(context, "ada kesalahan saat register");
      }
    } else {
      if(!context.mounted) return;
      pesan(context, "Silahkan logout dulu dari akun anda");
    }
  }
}