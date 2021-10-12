import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  static const ROUTE_NAME = 'MyElevatedButton';
  final String text;
  final VoidCallback? onPressed;

  MyElevatedButton(this.text, {required this.onPressed});
  @override
  MyElevatedButtonState createState() => MyElevatedButtonState();
}

class MyElevatedButtonState extends State<MyElevatedButton> {
  static const TAG = 'MyElevatedButton';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: widget.onPressed == null
            ? const LinearGradient(
                colors: [Color(0xFFC4C4C4), Color(0xFFC4C4C4)])
            : const LinearGradient(
                colors: [Color(0xffffa300), Color(0xffff4800)],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
              ),
      ),
      child: ElevatedButton(
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
