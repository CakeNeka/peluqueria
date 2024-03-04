import 'package:flutter/material.dart';

class DayOfWeekSelector extends StatefulWidget {
  const DayOfWeekSelector({Key? key}) : super(key: key);

  @override
  DayOfWeekSelectorState createState() => DayOfWeekSelectorState();
}

class DayOfWeekSelectorState extends State<DayOfWeekSelector> {
  String _selectedDay = 'Lunes';
  final List<String> _days = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

  String getSelectedDay() {
    return _selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Día seleccionado:',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
            onPressed: () => _showDayPicker(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$_selectedDay',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDayPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccionar día'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _days.length,
              itemBuilder: (BuildContext context, int index) {
                final day = _days[index];
                return ListTile(
                  title: Text(day),
                  onTap: () {
                    setState(() {
                      _selectedDay = day;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
