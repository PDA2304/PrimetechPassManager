import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validation;

  CustomTextField(
      {Key? key,
      this.labelText = '',
      this.onChanged,
      this.maxLength,
      this.minLines,
      this.maxLines = 1,
      this.controller,
      this.validation})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState(onChanged);
}

class _CustomTextFieldState extends State<CustomTextField> {
  final ValueChanged<String>? onChanged;
  Color borderColor = blue;
  String saveValue = "";

  _CustomTextFieldState(
    this.onChanged,
  );

  @override
  void initState() {
    super.initState();
    saveValue = widget.controller!.text;
    print(saveValue);
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
    }
    return test;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: (value) {
          setState(() {
            borderColor = saveValue != value ? orange : blue;
          });
        },
        validator: widget.validation,
        maxLength: widget.maxLength,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: widget.controller,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: widget.labelText,
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
          border: OutlineInputBorder(
            borderSide: BorderSide(color: red),
          ),
        ));
  }
}
