import 'package:flutter/material.dart';
import 'package:advance_form/theme_color.dart';
import 'package:advance_form/theme_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? errorText;
  const TextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.textInputType,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 16,
        right: 16,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
          errorText: errorText,
          fillColor: ThemeColor().textFieldColor,
          labelStyle: ThemeTextStyle().m3BodySmall,
          hintStyle: ThemeTextStyle().m3BodyLarge,
          label: Text(
            label,
          ),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: onChanged,
      ),
    );
  }
}