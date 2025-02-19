import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {required this.controller,
      required this.hintText,
      required this.onChanged,
      this.isObscure = false,
      this.validator,
      super.key});

  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      obscureText: isObscure,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
