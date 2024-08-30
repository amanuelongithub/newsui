import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final IconData icon;
  const MyButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 39,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Icon(icon),
    );
  }
}
