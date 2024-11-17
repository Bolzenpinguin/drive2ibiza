import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../utils/styleguide.dart';
import '../../utils/user_prefs.dart';
import 'calendar_events.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  Color userColor = appPrimaryColor; // Default color
  CalendarController _calendarController = CalendarController();
  String selectedView = "Month"; // Keep track of the current selected view

  @override
  void initState() {
    super.initState();
    _loadUserColor();
  }

  Future<void> _loadUserColor() async {
    Color? color = await UserPrefs.getUserColor();
    if (color != null) {
      setState(() {
        userColor = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main scaffold for the calendar
      body: Container(
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
        child: Column(
          children: [
            // Custom Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Display the Month and Year dynamically
                Text(
                  _getMonthAndYear(), // Dynamic Month and Year text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    // Month Button
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedView = "Month";
                          _calendarController.view = CalendarView.month;
                        });
                      },
                      child: Text(
                        "Month",
                        style: TextStyle(
                          color: selectedView == "Month" ? userColor : Colors.grey,
                          fontWeight:
                          selectedView == "Month" ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    // Week Button
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedView = "Week";
                          _calendarController.view = CalendarView.week;
                        });
                      },
                      child: Text(
                        "Week",
                        style: TextStyle(
                          color: selectedView == "Week" ? userColor : Colors.grey,
                          fontWeight:
                          selectedView == "Week" ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Calendar Widget
            Expanded(
              child: SfCalendar(
                controller: _calendarController,
                headerHeight: 0, // Hides the default calendar header
                view: CalendarView.month,
                allowedViews: [
                  CalendarView.month,
                  CalendarView.week,
                  CalendarView.day
                ], // Allow Month, Week, and Day views
                allowViewNavigation: true,
                firstDayOfWeek: 1, // Start week on Monday
                todayHighlightColor: appPrimaryColor,
                selectionDecoration: BoxDecoration(
                  shape: BoxShape.rectangle, // Disable the selection colors
                ),
                monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                ),
              ),
            ),
          ],
        ),
      ),

      // Add the floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            bool? result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CalendarEvents(),
              ),
            );
            if (result == true) {
              // Reload Calendar
            }
          },
        backgroundColor: userColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Helper method to get the current Month and Year
  String _getMonthAndYear() {
    DateTime currentDate = _calendarController.displayDate ?? DateTime.now();
    return "${_getMonthName(currentDate.month)} ${currentDate.year}";
  }

  // Helper method to get the full month name
  String _getMonthName(int month) {
    const monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return monthNames[month - 1];
  }
}