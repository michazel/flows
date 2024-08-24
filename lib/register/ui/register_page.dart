import 'package:flows/register/login_bloc/login_pass_bloc.dart';
import 'package:flows/register/register_bloc/register_pass_bloc.dart';
import 'package:flows/register/auth/email_auth.dart';
import 'package:flows/register/auth/google_auth.dart';
import 'package:flows/register/ui/login_page.dart';
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
                  style: Theme.of(context).textTheme.bodySmall,
                  keyboardType: TextInputType.emailAddress,
                ),
              ]
            ),
            const SizedBox(  
              height: 15,
            ),
            BlocBuilder<PassVerifBloc, RegisterPassState>(
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
                      bloc.add(NgetikRegistPass(
                        password: value,
                        verifPass: state.verifPass
                      ));
                    },
                    decoration: InputDecoration(  
                      hintText: "Input Password Anda",
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      suffixIcon: IconButton(  
                        onPressed: () {
                          bloc.add(NutupRegistPass( 
                            password: state.password,
                            verifPass: state.verifPass
                          ));
                        },
                        icon: (state.tutupPass) ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
                      )
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: state.tutupPass,
                  ),
                  const SizedBox(  
                    height: 10,
                  ),
                  TextField(  
                    controller: verifPasswordController,
                    onChanged: (value) {
                      bloc.add(NgetikRegistVerifPass(
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
                      suffixIcon: IconButton(  
                        onPressed: () {
                          bloc.add(NutupRegistVerifPass( 
                            password: state.password,
                            verifPass: state.verifPass
                          ));
                        },
                        icon: (state.tutupVerifPass) 
                          ? const Icon(Icons.visibility) 
                          : const Icon(Icons.visibility_off)
                      ),
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: state.tutupVerifPass,
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
                        onPressed: (state.panjang && state.besar && state.angka && state.kembar) 
                        ? () async {
                          if(passwordController.text == verifPasswordController.text) {
                            await EmailAuth(  
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
              onPressed: () async {
                await GoogleAuth().signInAndSignUp(notif, context);
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
                      create: (context) => LoginPassBloc(),
                      child: const LoginPage()
                    )
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