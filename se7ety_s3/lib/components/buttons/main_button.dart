import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 55,
    required this.onPressed,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.borderColor,
    this.borderRadius = 20,
  });
  final String text;
  final double width;
  final double height;
  final Function() onPressed;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.body.copyWith(color: textColor)),
      ),
    );
  }
}
