part of 'pass_verif_bloc.dart';

@immutable
sealed class PassVerifEvent {
  final String password;
  final String verifPass;

  const PassVerifEvent({
    required this.password, 
    required this.verifPass
  });
}

class NgetikPass extends PassVerifEvent {
  const NgetikPass({
    required super.password,
    required super.verifPass
  }) : super();
}

class NgetikVerifPass extends PassVerifEvent {
  const NgetikVerifPass({
    required super.password,
    required super.verifPass
  }) : super();
}
