import 'package:flows/mainPage/circular_progres.dart';
import 'package:flows/mainPage/input_page.dart';
import 'package:flutter/material.dart';

class AnalisisPage extends StatelessWidget {
  const AnalisisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
      child: Stack(
        children: [
          ListView(  
            children: <Widget>[
              Container(  
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: const BoxDecoration(  
                  color: Colors.amber
                ),
                child: const Center(  
                  child: CircularProgress(progress: 1 + (2 - (150000 / 100000)))
                )
              ),
              const SizedBox(  
                height: 20,
              ),
              const Row(  
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(  
                    children: <Widget>[
                      Text("Pengeluaran"),
                      Text("Rp. 100.000")
                    ]
                  ),
                  Column(  
                    children: <Widget>[
                      Text("Pemasukan"),
                      Text("Rp. 150.000")
                    ]
                  )
                ]
              ),
              const SizedBox(  
                height: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Balanced"),
                  Text("50.000")
                ]
              )
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