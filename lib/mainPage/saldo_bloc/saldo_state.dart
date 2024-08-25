part of 'saldo_bloc.dart';

@immutable
sealed class SaldoState {
  final double pendapatan;
  final double pengeluaran;

  const SaldoState({
    required this.pendapatan,
    required this.pengeluaran
  });
}

final class SaldoInitial extends SaldoState {
  const SaldoInitial({
    required super.pendapatan,
    required super.pengeluaran
  }) : super();
}
