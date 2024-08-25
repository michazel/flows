part of 'saldo_bloc.dart';

@immutable
sealed class SaldoEvent {
  final double pendapatan;
  final double pengeluaran;

  const SaldoEvent({
    required this.pendapatan,
    required this.pengeluaran
  });
}

class Reload extends SaldoEvent {
  const Reload({
    required super.pendapatan,
    required super.pengeluaran
  }) : super();
}
