import 'package:flutter/material.dart';

class BotaoWidget extends StatelessWidget {
  final String title;
  final void Function() onclik;

  const BotaoWidget({
    required this.onclik,
    required this.title, 
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4169E1),
          foregroundColor: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        onPressed: onclik,
        child: Text(title, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}