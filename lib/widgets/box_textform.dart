import 'package:flutter/material.dart';

class BoxTextFormField extends StatelessWidget {
  final String? labelText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final TextEditingController? controller;

  const BoxTextFormField({
    Key? key,
    this.labelText,
    this.validator,
    this.onSaved,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      controller: controller,
    );
  }
}
