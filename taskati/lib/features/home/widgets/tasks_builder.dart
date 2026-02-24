import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/features/home/widgets/tasks_list_view.dart';

class TasksBuilder extends StatefulWidget {
  const TasksBuilder({super.key});

  @override
  State<TasksBuilder> createState() => _TasksBuilderState();
}

class _TasksBuilderState extends State<TasksBuilder> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            indicatorPadding: const EdgeInsets.all(0),
            indicatorWeight: 0,
            indicator: BoxDecoration(),
            padding: const EdgeInsets.all(0),
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: [
              CustomTab(isSelected: _currentIndex == 0, title: 'All'),
              CustomTab(isSelected: _currentIndex == 1, title: 'In Progress'),
              CustomTab(isSelected: _currentIndex == 2, title: 'Completed'),
            ],
          ),
          Gap(12),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [TasksListView(), TasksListView(), TasksListView()],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.isSelected, required this.title});

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40,
      child: Container(
        width: double.infinity,
        height: 40,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primaryColor : AppColors.accentColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.caption1.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.backgroundColor
                  : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
