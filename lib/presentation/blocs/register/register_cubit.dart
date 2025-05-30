import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Cubit Submit: $state');
  }

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void onFormSubmitted() {
    emit(state.copyWith(formStatus: FormStatus.validating));
  }
}
