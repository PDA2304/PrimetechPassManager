import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';

class PasswordField extends StatefulWidget {
  final bool isObscure;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  PasswordField({
    Key? key,
    this.isObscure = false,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState(
        isObscure,
        onChanged,
      );
}

class _PasswordFieldState extends State<PasswordField> {
  final ValueChanged<String>? onChanged;
  bool isObscure;
  Color borderColor = blue;
  String saveValue = '';

  _PasswordFieldState(this.isObscure, this.onChanged);

  @override
  void initState() {
    super.initState();
    saveValue = widget.controller!.text;
  }

  Color _borderColor() {
    Color test = grey;
    if (borderColor == blue) {
      test = grey;
    }
    if (borderColor == orange) {
      test = borderColor;
    }
    if (widget.controller!.text == saveValue) {
      test = grey;
      borderColor = blue;
      saveValue = widget.controller!.text;
    }
    return test;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          borderColor = saveValue != value ? orange : blue;
        });
      },
      style: const TextStyle(fontSize: 20),
      obscureText: isObscure,
      decoration: InputDecoration(
          labelText: "Пароль",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _borderColor(),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: red),
          ),
          suffixIcon: InkWell(
            child: isObscure
                ? const Icon(Icons.visibility_off, color: grey)
                : const Icon(Icons.visibility, color: grey),
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          )),
    );
  }
}
