import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<DateTime> vacationDays = [
    DateTime.utc(2024, 3, 19),
    DateTime.utc(2024, 12, 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 25.0),
      child: TableCalendar(
    calendarStyle: CalendarStyle(
    holidayTextStyle: TextStyle(color: Colors.red),
    ),
        availableCalendarFormats: const {
          CalendarFormat.month: 'Mes',
        },
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 1, 1),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        eventLoader: (day) {
          if (vacationDays.any((vacationDay) => isSameDay(vacationDay, day))) {
            return [Event('Vacation')];
          }
          return [];
        },
      ),
    ));
  }
}

class Event {
  final String title;

  Event(this.title);
}
