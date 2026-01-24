import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

// < 18.5	Underweight
// 18.5 - 24.9	Healthy Weight
// 25.0 - 29.9	Overweight
// ≥ 30.0	Obese

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;

  String getClassification() {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result <= 24.9) {
      return 'Healthy Weight';
    } else if (result <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color getColor() {
    if (result < 18.5) {
      return Colors.amberAccent;
    } else if (result <= 24.9) {
      return Colors.green;
    } else if (result <= 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
        title: const Text(
          'Result Screen',
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getClassification(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: getColor()),
            ),
            const SizedBox(height: 16),
            Text(
              'Your BMI Result: ${result.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
