import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String id;
  final int? pendapatan;
  final int? pengeluaran;
  final String? deskripsi;
  static CollectionReference collection = FirebaseFirestore.instance.collection("saldo");

  Database({
    required this.id,
    this.pendapatan,
    this.pengeluaran,
    this.deskripsi
  });

  Future<void> addTransaksi() async {
    DocumentSnapshot snapshot = await collection.doc(id).get();

    if(snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> transaksi = data['transaksi'] as Map<String, dynamic>;
      int totalData = transaksi.length;

      transaksi[(totalData + 1).toString()] = {
        'pendapatan': pendapatan,
        'pengeluaran': pengeluaran,
        'deskripsi': deskripsi
      };

      await collection.doc(id).set({
        'transaksi': transaksi
      });
    } else {
      await collection.doc(id).set({
        'transaksi': {
          '1': {
            'pendapatan': pendapatan,
            'pengeluaran': pengeluaran,
            'deskripsi': deskripsi
          }
        }
      });
    }
  }
}