import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.bgColor = AppColors.primaryColor,
    this.width = double.infinity,
    this.height = 55,
    this.radius = 15,
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
            TextStyles.body.copyWith(
              color: AppColors.backgroundColor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
