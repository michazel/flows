import 'package:flows/mainPage/log_bloc/click_log_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Log extends StatelessWidget {
  final int pendapatan;
  final int pengeluaran;
  final String deskripsi;
  final String id;
  final ClickLogBloc bloc;

  const Log({
    super.key,
    required this.pendapatan,
    required this.pengeluaran,
    required this.deskripsi,
    required this.id,
    required this.bloc
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            BlocBuilder<ClickLogBloc, ClickLogState>(
              builder: (context, state) => Transform.translate(
                offset: const Offset(0, 70),
                child: AnimatedContainer(  
                  duration: const Duration(milliseconds: 800),
                  height: (state.activeId == id) 
                    ? state.height.toDouble() 
                    : 0,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(  
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      deskripsi,
                      style: Theme.of(context).textTheme.bodySmall
                    ),
                  )
                ),
              ),
            ),
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
                  Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Pendapatan",
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                      Text(
                        "Rp. $pendapatan",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ]
                  ),
                  Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Pengeluaran",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Rp. $pengeluaran",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ]
                  ),
                  IconButton(  
                    onPressed: () {
                      bloc.add(Click(
                        id: id
                      ));
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_rounded)
                  )
                ]
              )
            ),
          ],
        ),
        BlocBuilder<ClickLogBloc, ClickLogState>(
          builder: (_, state) => AnimatedContainer(
            duration: const Duration(
              milliseconds: 800
            ),
            height: (state.activeId == id) 
              ? state.height.toDouble() 
              : 0,
            color: Colors.transparent
          ),
        ),
      ],
    );
  }
}