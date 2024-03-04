import 'package:flutter/material.dart';
import 'package:peluqueria/models/diafestivo.dart';
import 'package:peluqueria/services/diafestivos_services';
import 'package:table_calendar/table_calendar.dart';
import 'package:peluqueria/models/diavacaciones.dart';
import 'package:peluqueria/services/diavacaciones_services.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  late List<DiaVacaciones> vacationDays = List.empty();
  late List<DiaFestivo> festiveDays = List.empty();

  @override
  void initState() {
    super.initState();
    cargarDiasVacaciones();
    cargarDiasFestivos();
  }

  Future<void> cargarDiasVacaciones() async {
    final diaVacacionesServices = DiaVacacionesServices();
    List<String> diasString =
        (await diaVacacionesServices.loadDiaVacaciones()).cast<String>();
    vacationDays = diasString.cast<DiaVacaciones>();
    setState(() {});
  }

  Future<void> cargarDiasFestivos() async {
    final diaFestivoServices = DiaFestivoServices();
    List<String> diasString =
        (await diaFestivoServices.loadDiaFestivo()).cast<String>();
    festiveDays = diasString.cast<DiaFestivo>();
    setState(() {});
  }

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
            } else if (_rangeEnd == null ||
                selectedDay.isBefore(_rangeStart!)) {
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
            final List<Event> events = [];

            if (vacationDays.any((dia) => isSameDay(DateTime.parse(dia.fecha), day))) {
              events.add(Event('Vacaciones'));
            }
            
            if (festiveDays.any((dia) => isSameDay(DateTime.parse(dia.fecha), day))) {
              events.add(Event('Festivo'));
            }

            return events;
          },
        ),
      ),
    );
  }
}

class Event {
  final String title;

  Event(this.title);
}
