part of 'validate_cubit.dart';

class ValidateState {
  bool check;

  ValidateState({this.check = true});

  ValidateState copyWith(bool? text){
    return ValidateState(check: text ?? check);
  }
}
