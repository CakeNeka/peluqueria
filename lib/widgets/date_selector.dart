import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  get vacationDays => null;

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector>{
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

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
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        onDaySelected: (selectedDay, focusedDay) {
          if (_rangeStart == null) {
            _rangeStart = selectedDay;
          } else if (_rangeEnd == null || selectedDay.isBefore(_rangeStart!)) {
            _rangeEnd = _rangeStart;
            _rangeStart = selectedDay;
          } else if (selectedDay.isAfter(_rangeStart!)) {
            _rangeEnd = selectedDay;
          }
          setState(() {
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
  void getDaysInBetween() {
    List<DateTime> days = [];
    DateTime? startDate = _rangeStart;
    DateTime? endDate = _rangeEnd;
    for (int i = 0; i <= endDate!.difference(startDate!).inDays; i++) {
      days.add(startDate!.add(Duration(days: i)));
    }
    for(DateTime day in days) {
      vacationDays.add(day);
    }
  }
}

class Event {
  final String title;

  Event(this.title);
}
