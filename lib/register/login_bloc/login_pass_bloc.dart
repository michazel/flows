import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_pass_event.dart';
part 'login_pass_state.dart';

class LoginPassBloc extends Bloc<LoginPassEvent, LoginPassState> {
  LoginPassBloc() : super(const LoginPassInitial(
    tutupPass: true
  )) {
    on<NutupLoginPass>((event, emit) {
      final bool isTutupPass = (state.tutupPass) ? false : true;

      emit(LoginPassInitial(  
        tutupPass: isTutupPass
      ));
    });
  }
}
