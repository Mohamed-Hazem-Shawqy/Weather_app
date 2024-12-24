import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  final String image;
  final String title;
  const Onboarding({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        const SizedBox(height: 200),
        Text(title),
      ],
    );
  }
}
