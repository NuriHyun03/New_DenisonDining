import 'package:flutter/material.dart';

class SubTitleHome extends StatelessWidget {
  final String stitle;

  const SubTitleHome({
    super.key,
    required this.stitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        stitle,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lora',
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}
