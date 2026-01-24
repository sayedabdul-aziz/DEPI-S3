import 'package:bmi_calculator/bmi/page/result_screen.dart';
import 'package:bmi_calculator/bmi/widgets/counter_card.dart';
import 'package:bmi_calculator/bmi/widgets/gender_card.dart';
import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  int weight = 60;
  int age = 25;
  int height = 180;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'BMI Calculator Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // male and female
            _genderSelection(),
            const SizedBox(height: 16),
            _heightSelection(),
            const SizedBox(height: 16),
            _weightAndAgeSelection(),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Calculate BMI and navigate to ResultScreen
                // BMI = 	weight (kg) /height2 (m)
                double result = (weight / ((height / 100) * (height / 100)));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _genderSelection() {
    return Expanded(
      child: Row(
        children: [
          GenderCard(
            text: 'Male',
            isSelected: isMale,
            icon: Icons.male,
            onPressed: () {
              setState(() {
                isMale = true;
              });
            },
          ),
          const SizedBox(width: 16),
          GenderCard(
            text: 'Female',
            isSelected: !isMale,
            icon: Icons.female,
            onPressed: () {
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded _heightSelection() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Height',
              style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '$height',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'cm',
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                ),
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 80,
              max: 220,
              activeColor: AppColors.primaryColor,
              inactiveColor: AppColors.greyColor,
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded _weightAndAgeSelection() {
    return Expanded(
      child: Row(
        children: [
          CounterCard(
            text: 'Weight',
            value: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              if (weight > 0) {
                setState(() {
                  weight--;
                });
              }
            },
          ),
          const SizedBox(width: 16),
          CounterCard(
            text: 'Age',
            value: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              if (age > 0) {
                setState(() {
                  age--;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
