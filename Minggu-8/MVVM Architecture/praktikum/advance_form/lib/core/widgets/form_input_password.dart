import 'package:advance_form/core/colors.dart';
import 'package:flutter/material.dart';

class FozFormInputPassword extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const FozFormInputPassword({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    bool isVisible = false;

    return StatefulBuilder(
      builder: (context, setState) => TextFormField(
        controller: controller,
        obscureText: !isVisible,
        validator: validator,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.background,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            labelText: label,
            labelStyle: TextStyle(
              color: AppColors.primary,
            ),
            hintText: hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: IconButton(
              onPressed: () => setState(() => isVisible = !isVisible),
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
              ),
            )),
        onChanged: (value) {},
      ),
    );
  }
}