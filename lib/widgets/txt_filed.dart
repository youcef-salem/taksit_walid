import 'package:flutter/material.dart';

class txtFiled_add extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Size size;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
   final int maxligne ; // Default to single line
  const txtFiled_add({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.size,
    this.onChanged,
    this.validator,
    this.controller,
    this.focusNode,
    this.maxligne = 1, // Default to single line
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: size.width * 0.8,
        height: validator==null? 70 : 90, // Adjust height based on validator presence
        child: TextFormField(
          focusNode: focusNode,
          maxLines: maxligne ,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          // Add these properties for Arabic support
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF0F2F5),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: const OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
            // Align hint and label to right
            alignLabelWithHint: true,
            hintTextDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
