import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
                  onPressed: () {},
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
                  onPressed: () {},
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
              onPressed: () {},
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