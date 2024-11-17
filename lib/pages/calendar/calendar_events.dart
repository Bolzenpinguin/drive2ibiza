import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class CalendarEvents extends StatefulWidget {
  const CalendarEvents({super.key});

  @override
  _CalendarEventsState createState() => _CalendarEventsState();
}

class _CalendarEventsState extends State<CalendarEvents> {
  bool isWholeDay = false; // State variable for Whole Day toggle
  DateTime selectedStartDate = DateTime.now(); // State for Start Date
  TimeOfDay selectedStartTime = TimeOfDay(hour: 9, minute: 30); // State for Start Time
  DateTime selectedEndDate = DateTime.now(); // State for End Date
  TimeOfDay selectedEndTime = TimeOfDay(hour: 14, minute: 0); // State for End Time

  // Function to pick a date
  Future<void> _selectDate(BuildContext context, bool bool) async {
    DateTime initialDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        // Call the static method here
        return AppTheme.datePickerTheme(context, child);
      },
    );

    if (pickedDate != null) {
      setState(() {
        // Update the state with the selected date
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    TimeOfDay initialTime = isStart ? selectedStartTime : selectedEndTime;
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        // Apply TimePicker theme
        return AppTheme.timePickerTheme(context, child);
      },
    );

    if (pickedTime != null) {
      setState(() {
        if (isStart) {
          selectedStartTime = pickedTime;
        } else {
          selectedEndTime = pickedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Booking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Start Date and Time Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Start'),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => _selectDate(context, true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "${selectedStartDate.toLocal()}".split(' ')[0],
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: isWholeDay ? null : () => _selectTime(context, true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isWholeDay
                                      ? Colors.grey.shade300
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  isWholeDay
                                      ? '--:--'
                                      : selectedStartTime.format(context),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // End Date and Time Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('End'),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => _selectDate(context, false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "${selectedEndDate.toLocal()}".split(' ')[0],
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: isWholeDay ? null : () => _selectTime(context, false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isWholeDay
                                      ? Colors.grey.shade300
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  isWholeDay
                                      ? '--:--'
                                      : selectedEndTime.format(context),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Whole Day Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Whole Day'),
                        Switch(
                          value: isWholeDay,
                          onChanged: (bool value) {
                            setState(() {
                              isWholeDay = value; // Update the toggle state
                            });
                          },
                          activeColor: Colors.blue,
                          inactiveThumbColor: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Description Input
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter details here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),

                    // Save Button
                    ElevatedButton(
                      onPressed: () {
                        print("Start: ${selectedStartDate.toLocal()} ${selectedStartTime.format(context)}");
                        print("End: ${selectedEndDate.toLocal()} ${selectedEndTime.format(context)}");
                        print("Whole Day: $isWholeDay");
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Save Reservation'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}