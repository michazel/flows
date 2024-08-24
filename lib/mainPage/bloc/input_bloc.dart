import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputInitial()) {
    on<InputEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
