import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  final Function(DateTime) onDaySelected;

  CalendarWidget({required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      onDaySelected: (selectedDay, focusedDay) {
        onDaySelected(selectedDay);
      },
    );
  }
}
