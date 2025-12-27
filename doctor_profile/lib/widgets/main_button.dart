import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.bgColor = Colors.indigoAccent,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width,
    this.textColor = Colors.white,
  });

  final Color bgColor;
  final String text;
  final Function() onPressed;
  final double height;
  final double? width;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          // maximumSize: Size(double.infinity, 50),
          // minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
      ),
    );
  }
}
