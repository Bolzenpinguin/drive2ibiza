import 'package:drive2ibiza/utils/styleguide.dart';
import 'package:flutter/material.dart';

class ColorSettings extends StatefulWidget {
  const ColorSettings({super.key});

  @override
  _ColorSettingsState createState() => _ColorSettingsState();
}

class _ColorSettingsState extends State<ColorSettings> {
  // TODO Default color noch laden
  Color selectedColor = Colors.black; // Default selected color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(marginSmall),
              padding: const EdgeInsets.all(paddingSmall),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadiusMedium),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 10.0, // Shadow blur radius
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Please select a new color',
                    style: TextStyle(fontSize: 24),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Colors',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 30,
                    children: [
                      _buildColorCircle(Colors.black),
                      _buildColorCircle(Colors.blue),
                      _buildColorCircle(Colors.green),
                      _buildColorCircle(Colors.yellow),
                      _buildColorCircle(Colors.purple),
                      _buildColorCircle(Colors.lightBlue),
                      _buildColorCircle(Colors.red),
                      _buildColorCircle(Colors.deepPurple),
                      _buildColorCircle(Colors.brown),
                      _buildColorCircle(Colors.lightBlueAccent)
                    ],
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      // TODO Abspeichern hinzufügen
                      print('Save New Color BTN pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: btnFontColor,
                      backgroundColor: btnBackgroundColor,
                    ),
                    child: Text('Save new color'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedColor == color ? color : Colors.transparent,
        ),
        child: Container(
          // Inner White Border Circle
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}