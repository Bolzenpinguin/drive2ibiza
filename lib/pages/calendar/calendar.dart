import 'package:flutter/material.dart';
import '../../utils/styleguide.dart';
import '../../pages/calendar/calendar_widget.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Drive2Ibiza (TBA)',
          style: TextStyle(color: fontColor),
        ),
        centerTitle: true,
        backgroundColor: appNavBarColor,
      ),
      body: CalendarWidget(),
    );
  }
}