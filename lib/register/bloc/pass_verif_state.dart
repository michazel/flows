part of 'pass_verif_bloc.dart';

@immutable
sealed class PassVerifState {
  final bool panjang;
  final bool angka;
  final bool besar;
  final bool kembar;
  final String password;
  final String verifPass;
  final Color color;

  const PassVerifState({
    required this.angka, 
    required this.panjang, 
    required this.besar,
    required this.kembar,
    required this.password,
    required this.verifPass,
    required this.color
  }) : super();
}

final class PassVerifInitial extends PassVerifState {
  const PassVerifInitial({
    required super.angka, 
    required super.panjang, 
    required super.besar,
    required super.kembar,
    required super.password,
    required super.verifPass,
    required super.color
  }) : super();
}