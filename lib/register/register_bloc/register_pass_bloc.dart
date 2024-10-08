import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'register_pass_event.dart';
part 'register_pass_state.dart';

class PassVerifBloc extends Bloc<RegisterPassEvent, RegisterPassState> {
  PassVerifBloc() : super(const PassVerifInitial(
    panjang: false,
    angka: false,
    besar: false,
    kembar: false,
    tutupPass: true,
    tutupVerifPass: true,
    password: "",
    verifPass: "",
    color: Colors.black
  )) {
    on<NgetikRegistPass>((event, emit) {
      final bool isPanjang = event.password.length >= 8;
      final bool hasAngka = RegExp(r'\d').hasMatch(event.password);
      final bool hasBesar = RegExp(r'[A-Z]').hasMatch(event.password);
      final bool isKembar = event.password == event.verifPass;

      emit(PassVerifInitial(
        panjang: isPanjang, 
        angka: hasAngka,  
        besar: hasBesar,
        kembar: isKembar,
        tutupPass: state.tutupPass,
        tutupVerifPass: state.tutupVerifPass,
        password: event.password,
        verifPass: event.verifPass,
        color: (isKembar) ? Colors.black : Colors.amber
      ));
    });

    on<NgetikRegistVerifPass>((event, emit) {
      final bool isKembar = event.password == event.verifPass;

      emit(PassVerifInitial(  
        panjang: state.panjang, 
        angka: state.angka,
        besar: state.besar,
        kembar: isKembar,
        tutupPass: state.tutupPass,
        tutupVerifPass: state.tutupVerifPass,
        password: event.password,
        verifPass: event.verifPass,
        color: (isKembar) ? Colors.black : Colors.amber
      ));
    });

    on<NutupRegistPass>((event, emit) {
      final bool isTutupPass = (state.tutupPass) ? false : true;

      emit(PassVerifInitial(  
        panjang: state.panjang, 
        angka: state.angka,
        besar: state.besar,
        kembar: state.kembar,
        tutupPass: isTutupPass,
        tutupVerifPass: state.tutupVerifPass,
        password: event.password,
        verifPass: event.verifPass,
        color: (state.kembar) ? Colors.black : Colors.amber
      ));
    });

    on<NutupRegistVerifPass>((event, emit) {
      final bool isTutupVerifPass = (state.tutupVerifPass) ? false : true;

      emit(PassVerifInitial(  
        panjang: state.panjang, 
        angka: state.angka,
        besar: state.besar,
        kembar: state.kembar,
        tutupPass: state.tutupPass,
        tutupVerifPass: isTutupVerifPass,
        password: event.password,
        verifPass: event.verifPass,
        color: (state.kembar) ? Colors.black : Colors.amber
      ));
    });
  }
}