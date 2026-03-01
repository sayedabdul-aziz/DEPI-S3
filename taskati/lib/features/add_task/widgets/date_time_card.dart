import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/shadows.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_svg_picture.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    super.key,
    required this.label,
    required this.value,
    required this.path,
    required this.onTap,
  });

  final String label;
  final String value;
  final String path;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: AppShadows.defaultShadow,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          minTileHeight: 0,
          leading: CustomSvgPicture(path: path),
          title: Text(
            label,
            style: TextStyles.caption2.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          subtitle: Text(value, style: TextStyles.caption1),
          trailing: CustomSvgPicture(
            path: AppAssets.arrowDownSvg,
            color: context.iconColor,
          ),
        ),
      ),
    );
  }
}
