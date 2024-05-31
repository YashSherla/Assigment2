import 'package:flutter/material.dart';

class Imagewidget extends StatelessWidget {
  const Imagewidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/image.png',
          height: 300,
          fit: BoxFit.cover,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          top: 20,
          left: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
