import 'package:flutter/material.dart';

class txtFiled_add extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Size size;
  
  const txtFiled_add({
    super.key,
    required this.hintText, 
    required this.labelText,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(

        width: size.width * 0.8,
        height:70, // Adjusted height
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF0F2F5),

            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}