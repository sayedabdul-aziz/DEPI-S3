import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';

class HomeDatePicker extends StatefulWidget {
  const HomeDatePicker({super.key});

  @override
  State<HomeDatePicker> createState() => _HomeDatePickerState();
}

class _HomeDatePickerState extends State<HomeDatePicker> {
  final DatePickerController _controller = DatePickerController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _controller.jumpToSelection();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now().subtract(const Duration(days: 30)),
      height: 90,
      width: 64,
      controller: _controller,
      initialSelectedDate: DateTime.now(),
      selectionColor: AppColors.primaryColor,
      selectedTextColor: Colors.white,
      calendarType: CalendarType.gregorianDate,
      onDateChange: (date) {},
    );
  }
}
