import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  DateTime today = DateTime.now();
  bool isDayChanged = false;

  void onDaySelected( DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      if(today == DateTime.now()){
        isDayChanged = false;
      }
      else{
        isDayChanged = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TableCalendar(
          headerVisible: true,
          selectedDayPredicate: (day) => isSameDay(day, today),
          onDaySelected: onDaySelected,
          calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(color: isDayChanged ? Colors.black : Colors.white),
            todayDecoration: const BoxDecoration(color: Colors.white),
            selectedDecoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
            )
          ),
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          focusedDay: today,
          lastDay: DateTime.utc(2030, 9, 11),
          firstDay: DateTime.utc(2022, 12, 11),
        )
    );
  }
}