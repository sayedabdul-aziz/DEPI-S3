import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.text,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  });

  final String text;
  final int value;
  final Function() onAdd;
  final Function() onRemove;

  @override
  Widget build(BuildContext context) {
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
              text,
              style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.greyColor,
                  ),
                  onPressed: onRemove,
                  icon: const Icon(Icons.remove),
                ),
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.greyColor,
                  ),
                  onPressed: onAdd,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
