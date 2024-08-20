import 'package:flows/register/bloc/pass_verif_bloc.dart';
import 'package:flows/register/email_auth.dart';
import 'package:flows/register/google_auth.dart';
import 'package:flows/register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifPasswordController = TextEditingController();

  void notif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade900,
      content: Text(message.toString())));
  }

  @override
  Widget build(BuildContext context) {
    PassVerifBloc bloc = BlocProvider.of<PassVerifBloc>(context);

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
                const SizedBox(  
                  height: 15,
                ),
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
            BlocBuilder<PassVerifBloc, PassVerifState>(
              builder: (context, state) => Column(  
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
                    onChanged: (value) {
                      bloc.add(NgetikPass(
                        password: value,
                        verifPass: state.verifPass
                      ));
                    },
                    decoration: InputDecoration(  
                      hintText: "Input Password Anda",
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(10)
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(  
                    height: 10,
                  ),
                  TextField(  
                    controller: verifPasswordController,
                    onChanged: (value) {
                      bloc.add(NgetikVerifPass(
                        verifPass: value,
                        password: state.password
                      ));
                    },
                    decoration: InputDecoration(  
                      hintText: "Input Password Lagi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(  
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(  
                          color: state.color
                        )
                      ),
                      enabledBorder: OutlineInputBorder(  
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(  
                          color: state.color
                        )
                      )
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(  
                    height: 10,
                  ),  
                  Padding(  
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Harus 8 character",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        color: (state.panjang) ? Colors.black : Colors.amber
                      )
                    ),
                  ),
                  Padding(  
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Harus ada 1 angka",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        color: (state.angka) ? Colors.black : Colors.amber
                      )
                    ),
                  ),
                  Padding(  
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Harus ada huruf besar",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        color: (state.besar) ? Colors.black : Colors.amber
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: ElevatedButton(  
                        onPressed: (state.panjang && state.besar && state.angka && state.kembar) ? () {
                          if(passwordController.text == verifPasswordController.text) {
                            EmailAuth(  
                              email: emailController.text,
                              password: passwordController.text
                            ).signUp(notif, context);
                          } 
                        } : null,
                        child: const Text("Sign Up")
                      ),
                    ),
                  ),
                ]
              ),
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