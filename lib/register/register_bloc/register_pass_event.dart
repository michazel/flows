part of 'register_pass_bloc.dart';

@immutable
sealed class RegisterPassEvent {
  final String password;
  final String verifPass;

  const RegisterPassEvent({
    required this.password, 
    required this.verifPass
  });
}

class NgetikRegistPass extends RegisterPassEvent {
  const NgetikRegistPass({
    required super.password,
    required super.verifPass
  }) : super();
}

class NgetikRegistVerifPass extends RegisterPassEvent {
  const NgetikRegistVerifPass({
    required super.password,
    required super.verifPass
  }) : super();
}

class NutupRegistPass extends RegisterPassEvent {
  const NutupRegistPass({
    required super.password,
    required super.verifPass
  }) : super();
}

class NutupRegistVerifPass extends RegisterPassEvent {
  const NutupRegistVerifPass({
    required super.password,
    required super.verifPass
  }) : super();
}