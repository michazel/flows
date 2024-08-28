import 'package:flows/mainPage/ui/setting/email_link.dart';
import 'package:flows/register/auth/auto_auth.dart';
import 'package:flows/register/auth/google_auth.dart';
import 'package:flows/register/register_bloc/register_pass_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  void notif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade900,
      content: Text(message.toString())
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(  
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Column(  
        children: <Widget> [
          Text(
            "Tautkan dengan akun lainnya",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(  
            height: 10,
          ),
          Row(  
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 1),
              SizedBox(  
                width: 150,
                child: ElevatedButton(  
                  onPressed: () {
                    Navigator.push(  
                      context,
                      MaterialPageRoute(  
                        builder: (context) => BlocProvider(
                          create: (context) => PassVerifBloc(),
                          child: const EmailLink()
                        )
                      )
                    );
                  },
                  child: Text( 
                    "Gmail",
                    style: Theme.of(context).textTheme.bodySmall
                  )
                )
              ),
              const Spacer(flex: 1),
              SizedBox(  
                width: 150,
                child: ElevatedButton(  
                  onPressed: () {
                    GoogleAuth().signInAndSignUp(notif, context);
                  },
                  child: Text( 
                    "Google",
                    style: Theme.of(context).textTheme.bodySmall
                  )
                )
              ),
              const Spacer(flex: 1),
            ]
          ),
          const SizedBox(  
            height: 20,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(  
              style: ElevatedButton.styleFrom(  
                backgroundColor: Colors.red
              ),
              onPressed: () async {
                await AutoAuth().logout();
                
                if(context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                "Log Out",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white
                ),
              )
            ),
          )
        ]
      )
    );
  }
}