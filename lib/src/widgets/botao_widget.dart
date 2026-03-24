import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {

  final String title;
  final void Function() onclick;
  
  const ElevatedButtonWidget({
    required this.title,
    required this.onclick,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onclick, 
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 32, 134, 250),
        fixedSize: const Size(400, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}