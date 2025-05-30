import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));
    final errorBorder = border.copyWith(
      borderSide: BorderSide(
        color: Colors.red.shade700.withValues(alpha: 0.60),
        width: 3,
      ),
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: colors.primary.withValues(alpha: 0.60),
            width: 3,
          ),
        ),
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,

        isDense: true,
        label: (label != null) ? Text(label!) : null,
        hintText: hintText,
        errorText: errorMessage,
        focusColor: colors.primary,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: colors.primary) : null,
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: colors.primary) : null,
        // icon: Icon(Icons.outbond_outlined, color: colors.primary),
      ),
    );
  }
}
