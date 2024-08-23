import 'package:flows/mainPage/log.dart';
import 'package:flutter/material.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: ListView(  
        children: const <Widget>[
          Log(),
          Log(),
          Log(),
        ]
      ),
    );
  }
}