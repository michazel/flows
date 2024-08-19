import 'package:flows/register/email_auth.dart';
import 'package:flows/register/google_auth.dart';
import 'package:flows/register/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifPasswordController = TextEditingController();
  bool verifPass = true;

  void notif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade900,
      content: Text(message.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(  
          children: <Widget>[
            Column(  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  "Yok daftar dulu yok",
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ]
            ),
            const SizedBox(  
              height: 15,
            ),
            Column(  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Email",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey
                  )
                ),
                TextField(  
                  controller: emailController,
                  decoration: InputDecoration(  
                    hintText: "Input Email anda",
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.all(10)
                  ),
                  style: Theme.of(context).textTheme.bodySmall
                ),
              ]
            ),
            const SizedBox(  
              height: 15,
            ),
            Column(  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey
                  )
                ),
                TextField(  
                  controller: passwordController,
                  decoration: InputDecoration(  
                    hintText: "Input Password anda",
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.all(10)
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  obscureText: true,
                ),
                const SizedBox(  
                  height: 10,
                ),
                TextField(  
                  controller: verifPasswordController,
                  decoration: InputDecoration(  
                    hintText: "Input Password Lagi",
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: (verifPass) ? Colors.white : Colors.amber
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  obscureText: true,
                ),
              ]
            ),
            const SizedBox(  
              height: 20,
            ),
            ElevatedButton(  
              onPressed: () {
                if(passwordController.toString() == verifPasswordController.toString()) {
                  EmailAuth(  
                    email: emailController.text,
                    password: passwordController.text
                  ).signUp(notif, context);
                } else {
                  verifPass = false;
                }
                // FirebaseAuth.instance.signOut();
              },
              child: const Text("Sign Up")
            ),
            const SizedBox(  
              height: 20,
            ),
            Align(  
              alignment: Alignment.center,
              child: Text(
                "- Or sign Up with -",
                style: Theme.of(context).textTheme.bodySmall
              ),
            ),
            const SizedBox(  
              height: 20,
            ),
            ElevatedButton(  
              onPressed: () {
                GoogleAuth().signInAndSignUp(notif, context);
              },
              child: const Text("Google")
            ),
            const SizedBox(  
              height: 20,
            ),
            GestureDetector(  
              onTap: () {
                Navigator.push(  
                  context, 
                  MaterialPageRoute(  
                    builder: (context) => const LoginPage()
                  )
                );
              },
              child: Align(  
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sudah punya akun?",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12
                  )
                )
              )
            )
          ]
        ),
      )
    );
  }
}