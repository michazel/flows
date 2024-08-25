import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'click_log_event.dart';
part 'click_log_state.dart';

class ClickLogBloc extends Bloc<ClickLogEvent, ClickLogState> {
  ClickLogBloc() : super(const InputInitial(
    height: 0,
    activeId: ''
  )) {
    on<Click>((event, emit) async {
      if(state.height == 0) {
        emit(InputInitial(
          activeId: event.id,
          height: 50
        ));
      } else {
        emit(InputInitial(
          activeId: event.id,
          height: 0
        ));
      }
    });
  }
}
