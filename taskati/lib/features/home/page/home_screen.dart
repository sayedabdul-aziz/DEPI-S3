import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/features/add_task/page/add_task_screen.dart';
import 'package:taskati/features/home/widgets/custom_tab.dart';
import 'package:taskati/features/home/widgets/daily_progress.dart';
import 'package:taskati/features/home/widgets/home_date_picker.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/tasks_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  int _currentTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                HomeHeader(),
                Gap(24),
                DailyProgress(),
                Gap(24),
                HomeDatePicker(
                  onDateChange: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                Gap(24),
                _statusTabs(),
                Gap(20),
                _tasksList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushTo(context, AddEditTaskScreen());
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.backgroundColor),
      ),
    );
  }

  TabBar _statusTabs() {
    return TabBar(
      indicatorPadding: const EdgeInsets.all(0),
      indicatorWeight: 0,
      indicator: BoxDecoration(),
      padding: const EdgeInsets.all(0),
      onTap: (int index) {
        setState(() {
          _currentTap = index;
        });
      },
      tabs: [
        CustomTab(isSelected: _currentTap == 0, title: 'All'),
        CustomTab(isSelected: _currentTap == 1, title: 'In Progress'),
        CustomTab(isSelected: _currentTap == 2, title: 'Completed'),
      ],
    );
  }

  Expanded _tasksList() {
    return Expanded(
      child: ValueListenableBuilder<Box<TaskModel>>(
        valueListenable: HiveHelper.tasksBox.listenable(),
        builder: (context, box, child) {
          List<TaskModel> dailyTasks = [];
          List<TaskModel> inProgressTasks = [];
          List<TaskModel> completedTasks = [];

          // get all tasks for the selected date
          var formattedDate = DateFormat("dd MMM, yyyy").format(selectedDate);

          for (var task in box.values) {
            if (task.date == formattedDate) {
              dailyTasks.add(task);
            }
          }
          // filter by status if task date is equals to selected date
          for (var task in dailyTasks) {
            if (task.isCompleted == true) {
              completedTasks.add(task);
            } else {
              inProgressTasks.add(task);
            }
          }
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              TasksListView(tasks: dailyTasks),
              TasksListView(tasks: inProgressTasks),
              TasksListView(tasks: completedTasks),
            ],
          );
        },
      ),
    );
  }
}
