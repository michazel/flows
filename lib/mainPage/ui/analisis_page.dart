import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flows/mainPage/database.dart';
import 'package:flows/mainPage/saldo_bloc/saldo_bloc.dart';
import 'package:flows/mainPage/ui/circular_progres.dart';
import 'package:flows/mainPage/ui/input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalisisPage extends StatelessWidget {
  const AnalisisPage({super.key});

  @override
  Widget build(BuildContext context) {
    SaldoBloc bloc = BlocProvider.of<SaldoBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
      child: Stack(
        children: [
          ListView(  
            children: <Widget>[
              StreamBuilder<DocumentSnapshot>(  
                stream: Database.collection.doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
                builder: (_, snapshot) {
                  if(snapshot.hasData && snapshot.data!.exists) {
                    double pengeluaran = 0;
                    double pendapatan = 0;

                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    Map<String, dynamic> transaksi = data['transaksi'] as Map<String, dynamic>;
                    
                    transaksi.forEach((key, value) {
                      pendapatan += (value['pendapatan'] as int).toDouble();
                      pengeluaran += (value['pengeluaran'] as int).toDouble();
                    });

                    bloc.add(Reload(  
                      pendapatan: pendapatan,
                      pengeluaran: pengeluaran
                    ));
                  }
                  return const SizedBox();
                }
              ),
              SizedBox(  
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Center(  
                  child: BlocBuilder<SaldoBloc, SaldoState>(
                    builder: (_, state) => CircularProgress(
                      progress: (state.pengeluaran == 0.0 && state.pendapatan == 0.0) ? 1
                        : (state.pendapatan > 0 && state.pengeluaran == 0.0) ? 2
                        : (state.pendapatan == 0.0 && state.pengeluaran > 0) ? 3
                        : (2 + (state.pengeluaran / state.pendapatan))
                    ),
                  )
                )
              ),
              const SizedBox(  
                height: 20,
              ),
              BlocBuilder<SaldoBloc, SaldoState>(
                builder: (_, state) => Row(  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(  
                      children: <Widget>[
                        Text(
                          "Pengeluaran",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "Rp. ${state.pengeluaran}",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ]
                    ),
                    Column(  
                      children: <Widget>[
                        Text(
                          "Pemasukan",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "Rp. ${state.pendapatan}",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ]
                    )
                  ]
                ),
              ),
              const SizedBox(  
                height: 20,
              ),
              BlocBuilder<SaldoBloc, SaldoState>(
                builder: (_, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Balanced",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Rp. ${state.pendapatan - state.pengeluaran}",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ]
                ),
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