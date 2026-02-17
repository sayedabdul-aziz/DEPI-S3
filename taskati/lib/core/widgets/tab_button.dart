import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.text,
    this.bgColor = AppColors.accentColor,
    this.width = 50,
    this.height = 35,
    this.radius = 9,
    required this.onPressed,
    this.textStyle,
  });

  final String text;
  final Color bgColor;
  final double width;
  final double height;
  final double radius;
  final Function() onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        minimumSize: Size(width, height),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            textStyle ??
            TextStyles.caption1.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
      ),
    );
  }
}
