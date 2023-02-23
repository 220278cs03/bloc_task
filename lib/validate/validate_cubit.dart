// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'validate_state.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(ValidateState());

  check(String name){
    emit(ValidateState(check: name == "Gulnoza"));
    //emit(state.copyWith(text == "Gulnoza"));
  }

}