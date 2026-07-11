import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se7ety/core/extentions/extension.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/patient/booking/data/appointment_model.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.model,
    required this.onRemove,
  });

  final AppointmentModel model;
  final Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      childrenPadding: const EdgeInsets.symmetric(vertical: 10),
      expandedCrossAxisAlignment: CrossAxisAlignment.end,
      backgroundColor: AppColors.accentColor,
      collapsedBackgroundColor: AppColors.accentColor,
      title: Text('د. ${model.doctorName}', style: TextStyles.title),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 10),
                Text(
                  DateFormat.yMMMMd('ar').format(model.date).toString(),
                  style: TextStyles.body,
                ),
                const SizedBox(width: 30),
                Text(
                  isToday(model.date) ? "اليوم" : "",
                  style: TextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.watch_later_outlined,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 10),
                Text(
                  DateFormat.jm('ar').format(model.date).toString(),
                  style: TextStyles.body,
                ),
              ],
            ),
          ],
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, right: 10, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('اسم المريض: ${model.name}', style: TextStyles.body),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: AppColors.primaryColor,
                    size: 16,
                  ),
                  const SizedBox(width: 10),
                  Text(model.location, style: TextStyles.body),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.whiteColor,
                    backgroundColor: AppColors.redColor,
                  ),
                  onPressed: onRemove,
                  child: const Text('حذف الحجز'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
