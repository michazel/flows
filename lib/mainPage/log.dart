import 'package:flutter/material.dart';

class Log extends StatelessWidget {
  const Log({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container( 
              margin: const EdgeInsets.only(bottom: 15), 
              height: 80,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(  
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(  
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(  
                    height: 5,
                  ),
                  const Column(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Pendapatan"),
                      Text("Rp. 150.000")
                    ]
                  ),
                  const Column(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Pengeluaran"),
                      Text("Rp. 100.000")
                    ]
                  ),
                  IconButton(  
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_rounded)
                  )
                ]
              )
            ),
            Transform.translate(
              offset: const Offset(0, 70),
              child: AnimatedContainer(  
                duration: const Duration(milliseconds: 800),
                height: 0,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(  
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("Deskripsi")
              ),
            )
          ],
        ),
        AnimatedContainer(
          duration: const Duration(
            milliseconds: 800
          ),
          height: 0,
          color: Colors.transparent
        ),
      ],
    );
  }
}