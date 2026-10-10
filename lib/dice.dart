import 'package:flutter/material.dart';

// ويدجيت مخصصة لعرض شكل النرد
class Dice extends StatelessWidget {
  final int number;
  const Dice({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffd1bbf7), // اللون البنفسجي الفاتح المناسب للتصميم
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$number',
        style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}