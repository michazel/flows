import 'package:flows/register/login_bloc/login_pass_bloc.dart';
import 'package:flows/register/register_bloc/register_pass_bloc.dart';
import 'package:flows/register/email_auth.dart';
import 'package:flows/register/google_auth.dart';
import 'package:flows/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void notif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade900,
      content: Text(message.toString())));
  }

  @override
  Widget build(BuildContext context) {
    LoginPassBloc bloc = BlocProvider.of<LoginPassBloc>(context);

    return Scaffold(  
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(  
          children: <Widget>[
            Column(  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  "Yok login dulu yok",
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
                  style: Theme.of(context).textTheme.bodySmall,
                  keyboardType: TextInputType.emailAddress,
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
                BlocBuilder<LoginPassBloc, LoginPassState>(
                  builder: (context, state) => TextField(  
                    controller: passwordController,
                    decoration: InputDecoration(  
                      hintText: "Input Password anda",
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(  
                        onPressed: () {
                          bloc.add(NutupLoginPass());
                        },
                        icon: (state.tutupPass) 
                          ? const Icon(Icons.visibility) 
                          : const Icon(Icons.visibility_off)
                      ),
                      contentPadding: const EdgeInsets.all(10)
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: state.tutupPass,
                  ),
                ),
              ]
            ),
            const SizedBox(  
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Lupa Password?",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12
                )
              )
            ),
            const SizedBox(  
              height: 20,
            ),
            ElevatedButton(  
              onPressed: () {
                EmailAuth(  
                  email: emailController.text,
                  password: passwordController.text
                ).signIn(notif, context);
              },
              child: const Text("Sign In")
            ),
            const SizedBox(  
              height: 20,
            ),
            Align(  
              alignment: Alignment.center,
              child: Text(
                "- Or sign in with -",
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
                    builder: (context) => BlocProvider(
                      create: (context) => PassVerifBloc(),
                      child: const RegisterPage(),
                    )
                  )
                );
              },
              child: Align(  
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nggak punya akun?",
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