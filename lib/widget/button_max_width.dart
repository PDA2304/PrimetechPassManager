import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color foregroundColor;
  final Function onPressed;

  const Button(
      {Key? key,
      required this.text,
      required this.foregroundColor,
      this.backgroundColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor != null
              ? MaterialStateProperty.all<Color>(backgroundColor!)
              : null,
          foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
        ),
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
