import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';

class ButtonIcon extends StatelessWidget {
  final double border;
  final Function onTap;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final double padding;

  const ButtonIcon(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.border = 10,
      this.text = "Кнопка",
      this.textColor = black,
      this.backgroundColor = white,
      this.iconColor = black,
      this.padding = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(border),
      color: backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(border),
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 22,
              ),
              const Padding(padding: EdgeInsets.only(right: 5)),
              Text(
                text,
                style: TextStyle(color: white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
