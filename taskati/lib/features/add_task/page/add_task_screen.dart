import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/add_task/widgets/date_time_card.dart';

class AddEditTaskScreen extends StatefulWidget {
  const AddEditTaskScreen({super.key, this.task});
  final TaskModel? task;

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String date = DateFormat("dd MMM, yyyy").format(DateTime.now());
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat(
    "hh:mm a",
  ).format(DateTime.now().add(Duration(hours: 1)));

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      titleController.text = widget.task?.title ?? '';
      descriptionController.text = widget.task?.description ?? '';
      date = widget.task?.date ?? '';
      startTime = widget.task?.startTime ?? '';
      endTime = widget.task?.endTime ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task != null ? 'Edit Task' : 'Add Task'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Column(
          children: [
            CustomTextField(
              label: 'Title',
              hint: 'Task title',
              controller: titleController,
            ),
            const Gap(18),
            CustomTextField(
              label: 'Description',
              hint: 'Task description',
              controller: descriptionController,
              maxLines: 4,
              minLines: 4,
              contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            ),
            const Gap(30),
            DateTimeCard(
              label: 'Date',
              value: date,
              path: AppAssets.calendarSvg,
              onTap: () => _selectDate(context),
            ),
            const Gap(24),
            DateTimeCard(
              label: 'Start Time',
              value: startTime,
              path: AppAssets.timeSvg,
              onTap: () => _pickTaskTime(isStartTime: true),
            ),
            const Gap(24),
            DateTimeCard(
              label: 'End Time',
              value: endTime,
              path: AppAssets.timeSvg,
              onTap: () => _pickTaskTime(isStartTime: false),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: MainButton(
          text: widget.task != null ? 'Save' : 'Add Task',
          radius: 18,
          textStyle: TextStyles.title.copyWith(
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.w600,
          ),
          onPressed: () {
            if (widget.task != null) {
              // update task
              HiveHelper.cacheTask(
                widget.task?.id ?? '',
                widget.task!.copyWith(
                  title: titleController.text,
                  description: descriptionController.text,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                  isCompleted: false,
                ),
              );
            } else {
              // add task
              String key = DateTime.now().millisecondsSinceEpoch.toString();
              HiveHelper.cacheTask(
                key,
                TaskModel(
                  id: key,
                  title: titleController.text,
                  description: descriptionController.text,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                  isCompleted: false,
                  createdAt: DateTime.now().toIso8601String(),
                ),
              );
            }
            pop(context);
          },
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null) {
      setState(() {
        date = DateFormat("dd MMM, yyyy").format(selectedDate);
      });
    }
  }

  Future<void> _pickTaskTime({required bool isStartTime}) async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime == null) return;

    final dateTime = DateTime(selectedTime.hour, selectedTime.minute);
    final formattedTime = DateFormat("hh:mm a").format(dateTime);

    setState(() {
      if (isStartTime) {
        startTime = formattedTime;
      } else {
        endTime = formattedTime;
      }
    });
  }
}
