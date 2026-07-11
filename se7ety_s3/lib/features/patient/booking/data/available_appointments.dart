import 'package:se7ety/core/extentions/extension.dart';

List<int> getAvailableAppointments(
  DateTime selectedDate,
  String start,
  String end,
) {
  int startHour = int.parse(start);
  int endHour = int.parse(end);

  List<int> availableHours = [];
  // 5 - 10
  for (int i = startHour; i < endHour; i++) {
    if (isToday(selectedDate)) {
      if (i > DateTime.now().hour) {
        availableHours.add(i);
      }
    } else {
      availableHours.add(i);
    }
  }

  return availableHours;
}
