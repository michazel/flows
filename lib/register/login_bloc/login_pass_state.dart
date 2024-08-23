part of 'login_pass_bloc.dart';

@immutable
sealed class LoginPassState {
  final bool tutupPass;

  const LoginPassState({required this.tutupPass});
}

final class LoginPassInitial extends LoginPassState {
  const LoginPassInitial({required super.tutupPass}) : super();
}
