import 'package:flutter/material.dart';

class buildPriceCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;
  bool isFullWidth;
   buildPriceCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    this.isFullWidth =false
  });

  @override
  Widget build(BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: isFullWidth 
            ? CrossAxisAlignment.center 
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isFullWidth 
                ? MainAxisAlignment.center 
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  textAlign: isFullWidth ? TextAlign.center : TextAlign.start,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color:Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: isFullWidth ? TextAlign.center : TextAlign.start,
          ),
        ],
      ),
    );
  }
}
