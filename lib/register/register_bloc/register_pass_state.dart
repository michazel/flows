part of 'register_pass_bloc.dart';

@immutable
sealed class RegisterPassState {
  final bool panjang;
  final bool angka;
  final bool besar;
  final bool kembar;
  final bool tutupPass;
  final bool tutupVerifPass;
  final String password;
  final String verifPass;
  final Color color;

  const RegisterPassState({
    required this.angka, 
    required this.panjang, 
    required this.besar,
    required this.kembar,
    required this.tutupPass,
    required this.tutupVerifPass,
    required this.password,
    required this.verifPass,
    required this.color
  }) : super();
}

final class PassVerifInitial extends RegisterPassState {
  const PassVerifInitial({
    required super.angka, 
    required super.panjang, 
    required super.besar,
    required super.kembar,
    required super.tutupPass,
    required super.tutupVerifPass,
    required super.password,
    required super.verifPass,
    required super.color
  }) : super();
}