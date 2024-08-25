import 'package:firebase_auth/firebase_auth.dart';
import 'package:flows/mainPage/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController pendapatanController = TextEditingController();
  TextEditingController pengeluaranController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(  
        title: const Text("Input"),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(  
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: Padding(  
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Column(  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Pendapatan",
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                TextField( 
                  controller: pendapatanController,
                  decoration: InputDecoration(  
                    hintText: "Masukan pendapatan anda",
                    border: OutlineInputBorder(  
                      borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: const EdgeInsets.all(10)
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                const SizedBox(  
                  height: 20,
                ),
                Text(
                  "Pengeluaran",
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                TextField( 
                  controller: pengeluaranController,
                  decoration: InputDecoration(  
                    hintText: "Masukan pengeluaran anda",
                    border: OutlineInputBorder(  
                      borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: const EdgeInsets.all(10)
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                const SizedBox(  
                  height: 20,
                ),
                Text(
                  "Deskripsi",
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                TextField( 
                  controller: deskripsiController,
                  decoration: InputDecoration(  
                    hintText: "Masukan deskripsi",
                    border: OutlineInputBorder(  
                      borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: const EdgeInsets.all(10)
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: null,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(  
                      width: 200,
                      child: ElevatedButton(  
                        onPressed: () async {
                          await Database( 
                            id: FirebaseAuth.instance.currentUser!.uid,
                            pendapatan: (pendapatanController.text == '') 
                              ? 0 
                              : int.parse(pendapatanController.text),
                            pengeluaran: (pengeluaranController.text == '')
                             ? 0
                             : int.parse(pengeluaranController.text),
                            deskripsi:  deskripsiController.text
                          ).addTransaksi();

                          if(!context.mounted) return;
                          Navigator.pop(context);
                        },
                        child: const Text("Input")
                      )
                    ),
                  ),
                ),
              ]
            ),
          ],
        )
      )
    );
  }
}