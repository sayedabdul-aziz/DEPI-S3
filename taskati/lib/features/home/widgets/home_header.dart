import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/services/shared_pref.dart';
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
    name = SharedPref.getString(SharedPref.nameKey);
    path = SharedPref.getString(SharedPref.imageKey);
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
                ),
        ),
        Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello!', style: TextStyles.caption1),
            Text(name, style: TextStyles.title),
          ],
        ),
      ],
    );
  }
}
