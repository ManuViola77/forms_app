part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;
  final FormStatus formStatus;

  const RegisterFormState({
    this.username = const Username.pure(),
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormStatus.invalid,
  });

  RegisterFormState copyWith({
    Username? username,
    bool? isValid,
    Email? email,
    Password? password,
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
