import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class DailyProgress extends StatelessWidget {
  const DailyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.tasksBox.listenable(),
      builder: (context, box, child) {
        List<TaskModel> todayTasks = [];
        List<TaskModel> completedTasks = [];

        for (var task in box.values) {
          if (task.date == DateFormat("dd MMM, yyyy").format(DateTime.now())) {
            todayTasks.add(task);
            if (task.isCompleted == true) {
              completedTasks.add(task);
            }
          }
        }

        double completedPercentage = todayTasks.isEmpty
            ? 0
            : (completedTasks.length / todayTasks.length) * 100;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.primaryColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat("EEEE, dd MMM").format(DateTime.now()),
                      style: TextStyles.caption1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                    Gap(12),
                    Text(
                      'Your today’s task almost Your today’s task almost',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
              // indicator
              CircularPercentIndicator(
                radius: 38,
                lineWidth: 8,
                percent: completedPercentage / 100,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Color(0XFF8764FF),
                progressColor: AppColors.backgroundColor,
                animation: true,
                animationDuration: 1500,
                center: Text(
                  "${completedPercentage.toInt()}%",
                  style: TextStyles.caption1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
