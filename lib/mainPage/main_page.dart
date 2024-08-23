import 'package:flows/mainPage/analisis_page.dart';
import 'package:flows/mainPage/log_page.dart';
import 'package:flows/mainPage/setting_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(  
        appBar: AppBar(  
          title: const Text("Flows"),
          backgroundColor: Colors.lightBlue,
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: const TabBar(  
          tabs: <Tab>[
            Tab(  
              icon: Icon(Icons.analytics),
              text: "Analisis",
            ),
            Tab(  
              icon: Icon(Icons.donut_large_rounded),
              text: "Log",
            ),
            Tab(  
              icon: Icon(Icons.settings),
              text: "Pengaturan",
            ),
          ]
        ),
        body: const TabBarView(  
          children: <Widget>[
            AnalisisPage(),
            LogPage(),
            SettingPage()
          ]
        )
      ),
    );
  }
}