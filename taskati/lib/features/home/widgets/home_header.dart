import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/text_styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String name = '';
  String path = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    name = HiveHelper.getCachedData(HiveHelper.nameKey);
    path = HiveHelper.getCachedData(HiveHelper.imageKey);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: path.isEmpty
              ? Image.asset(AppAssets.user, width: 50, height: 50)
              : Image.file(
                  File(path),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(AppAssets.user, width: 50, height: 50);
                  },
                ),
        ),
        Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello!', style: TextStyles.caption1),
              10.h,
              Text(name, style: TextStyles.title),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            bool isDark = HiveHelper.getCachedThemeMode();
            HiveHelper.cacheThemeMode(!isDark);
            setState(() {});
          },
          icon: Icon(context.isDark ? Icons.light_mode : Icons.dark_mode),
        ),
      ],
    );
  }
}
