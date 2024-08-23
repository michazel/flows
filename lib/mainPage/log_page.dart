import 'package:flows/mainPage/input_page.dart';
import 'package:flows/mainPage/log.dart';
import 'package:flutter/material.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Stack(
        children: <Widget>[
          ListView(  
            children: const <Widget>[
              Log(),
              Log(),
              Log(),
            ]
          ),
          Transform.translate(
            offset: Offset(
              MediaQuery.of(context).size.width - 30 - 70, 
              MediaQuery.of(context).size.height - 30 - 80 - 140
            ),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(  
                  context,
                  MaterialPageRoute(  
                    builder: (context) => const InputPage()
                  )
                );
              },
              child: const Icon(Icons.add)
            ),
          )
        ],
      ),
    );
  }
}