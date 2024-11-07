import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../utils/styleguide.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingSmall),
      margin: const EdgeInsets.all(marginSmall),
      decoration: BoxDecoration(
        color: whiteBackground,
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
          ),
        ],
      ),

      child: SfCalendar(
        headerStyle: CalendarHeaderStyle(
            backgroundColor: whiteBackground,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            )
        ),

        view: CalendarView.month,
        firstDayOfWeek: 1, // Start week on Monday
        todayHighlightColor: appPrimaryColor,
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
      ),


    );
  }
}