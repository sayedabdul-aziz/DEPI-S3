import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_svg_picture.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.cardColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: .1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title ?? '',
            style: TextStyles.caption1.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(6),
          Text(
            task.description ?? '',
            style: TextStyles.caption2.copyWith(
              color: AppColors.secondaryColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(12),
          Row(
            children: [
              CustomSvgPicture(path: AppAssets.timeSvg, width: 20),
              Gap(6),
              Text(
                '${task.startTime ?? ''} - ${task.endTime ?? ''}',
                style: TextStyles.caption2.copyWith(
                  color: AppColors.primary50Color,
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: task.isCompleted == true
                      ? AppColors.accentColor
                      : AppColors.orangeLightColor,
                ),
                child: Text(
                  task.isCompleted == true ? 'Done' : 'In Progress',
                  style: TextStyles.caption2.copyWith(
                    color: task.isCompleted == true
                        ? AppColors.primaryColor
                        : AppColors.orangeColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
