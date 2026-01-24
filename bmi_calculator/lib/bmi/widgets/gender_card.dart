import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

//var = (condition) ? true : false

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
  });
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.whiteColor, size: 80),
              const SizedBox(height: 8),
              Text(text, style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ),
      ),
    );
  }
}
