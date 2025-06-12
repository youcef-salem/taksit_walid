import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  void Function()? onPressed;
  String txt;
  final Size size;
  double widh_pref;
  MainButton({
    super.key,
    required this.txt,
    this.onPressed,
    required this.size,
    this.widh_pref = 0.8 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: size.width * widh_pref,

        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            txt,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
