import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color color;
  const TextIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: color,
          ),
        ),
      ],
    );
  }
}
