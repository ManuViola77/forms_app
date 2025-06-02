import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),

              _RegisterForm(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    // final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    //final usernameError = username.displayError;
    //final emailError = email.displayError;
    //final passwordError = password.displayError;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de Usuario',
            prefixIcon: Icons.person,
            onChanged: registerCubit.onUsernameChanged,
            errorMessage: username.errorMessage,
          ),

          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Correo electrónico',
            prefixIcon: Icons.email,
            onChanged: registerCubit.onEmailChanged,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'El correo electrónico es requerido';
              }

              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

              if (!emailRegExp.hasMatch(value)) {
                return 'El correo electrónico no es válido';
              }

              return null;
            },
          ),

          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Contraseña',
            prefixIcon: Icons.key,
            suffixIcon: Icons.remove_red_eye_rounded,
            obscureText: true,
            onChanged: registerCubit.onPasswordChanged,
            errorMessage: password.errorMessage,
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: Icon(Icons.save),
            label: Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
