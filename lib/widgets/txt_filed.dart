import 'package:flutter/material.dart';

class txtFiled_add extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Size size;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const txtFiled_add({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.size,
    this.onChanged,
    this.validator,
    this.controller,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: size.width * 0.8,
        height: 70,
        child: TextFormField(
          controller: controller,
          validator: validator,
          focusNode: focusNode,
          onChanged: onChanged,
          onFieldSubmitted: (value) {
            controller?.text = value;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF0F2F5),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: const OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}