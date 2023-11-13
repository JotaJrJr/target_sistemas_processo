import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onPressed,
    this.textInputAction,
    this.validator,
    this.focusNode,
    this.onSubmitted,
  });

  final bool obscureText;
  final TextEditingController controller;
  final VoidCallback onPressed;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      validator: validator != null ? (value) => validator!(value) : null,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: IconButton(
          color: Theme.of(context).colorScheme.outline,
          icon: obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
          onPressed: onPressed,
        ),
        hintText: "Digite a sua senha",
        // hintStyle: TextStyleApp.font16[400]!.copyWith(
        //   color: Theme.of(context).colorScheme.outline,
        // ),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
