import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_svg_picture.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) {
        return Gap(12);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.backgroundColor,
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
                'Title Of Task',
                style: TextStyles.caption1.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(6),
              Text(
                'Description Description Description Description Description DescriptionDescriptionDescriptionDescription',
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
                    '10:00 AM - 12:00 PM',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.primary50Color,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor,
                    ),
                    child: Text(
                      'In Progress',
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
