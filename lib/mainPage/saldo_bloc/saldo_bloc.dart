import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saldo_event.dart';
part 'saldo_state.dart';

class SaldoBloc extends Bloc<SaldoEvent, SaldoState> {
  SaldoBloc() : super(const SaldoInitial(
    pengeluaran: 0,
    pendapatan: 0
  )) {
    on<Reload>((event, emit) {
      emit(SaldoInitial(  
        pendapatan: event.pendapatan,
        pengeluaran: event.pengeluaran
      ));
    });
  }
}
