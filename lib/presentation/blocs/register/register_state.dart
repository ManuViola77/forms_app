part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final bool isValid;
  final Username username;
  final String email;
  final String password;
  final FormStatus formStatus;

  const RegisterFormState({
    this.username = const Username.pure(),
    this.isValid = false,
    this.email = '',
    this.password = '',
    this.formStatus = FormStatus.invalid,
  });

  RegisterFormState copyWith({
    Username? username,
    bool? isValid,
    String? email,
    String? password,
    FormStatus? formStatus,
  }) => RegisterFormState(
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object> get props => [username, email, password, formStatus, isValid];
}
