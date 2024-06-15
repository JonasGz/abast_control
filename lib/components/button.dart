import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback action;
  const Button(this.text, this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black87),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: action,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }
}
