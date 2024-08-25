import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flows/mainPage/log_bloc/click_log_bloc.dart';
import 'package:flows/mainPage/database.dart';
import 'package:flows/mainPage/ui/input_page.dart';
import 'package:flows/mainPage/ui/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    ClickLogBloc bloc = BlocProvider.of<ClickLogBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Stack(
        children: <Widget>[
          ListView(  
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(  
                stream: Database.collection.snapshots(),
                builder: (_, snapshot) {
                  if(snapshot.hasData) {
                    return Column(
                      children: snapshot.data!.docs.expand((e) {
                        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                        Map<String, dynamic> transaksi = data['transaksi'] as Map<String, dynamic>;

                        return transaksi.entries.map((e) => Log(  
                          pendapatan: e.value['pendapatan'],
                          pengeluaran: e.value['pengeluaran'],
                          id: e.key,
                          deskripsi: e.value['deskripsi'],
                          bloc: bloc,
                        )).toList();
                      }).toList()
                    );
                  } else {
                    return const Center(
                      child: SizedBox(  
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }
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