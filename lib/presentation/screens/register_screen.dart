import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: const _RegisterView(),
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de Usuario',
            prefixIcon: Icons.person,
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'El nombre de usuario es requerido';
              }

              if (value.length < 6) {
                return 'El nombre de usuario debe tener al menos 6 caracteres';
              }

              return null;
            },
          ),

          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Correo electrónico',
            prefixIcon: Icons.email,
            onChanged: (value) => email = value,
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
            onChanged: (value) => password = value,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'La contraseña es requerida';
              }

              if (value.length < 8) {
                return 'La contraseña debe tener al menos 8 caracteres';
              }

              return null;
            },
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState?.validate();

              if (isValid != true) return;
            },
            icon: Icon(Icons.save),
            label: Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
