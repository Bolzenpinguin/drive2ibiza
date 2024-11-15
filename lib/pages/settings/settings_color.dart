import 'package:drive2ibiza/utils/styleguide.dart';
import 'package:drive2ibiza/utils/user_prefs.dart';
import 'package:flutter/material.dart';

class ColorSettings extends StatefulWidget {
  const ColorSettings({super.key});

  @override
  _ColorSettingsState createState() => _ColorSettingsState();
}

class _ColorSettingsState extends State<ColorSettings> {
  Color selectedColor = appPrimaryColor; // Default color

  @override
  void initState() {
    super.initState();
    _loadUserColor();
  }

  Future<void> _loadUserColor() async {
    Color? savedColor = await UserPrefs.getUserColor();
    if (savedColor != null) {
      setState(() {
        selectedColor = savedColor;
      });
    }
  }

  Future<void> _saveColor() async {
    await UserPrefs.saveUserColor(selectedColor);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Color saved successfully')),
    );
    Navigator.pop(context, true);
  }

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
                      _buildColorCircle(Color.fromRGBO(158, 1, 6, 1)),
                      _buildColorCircle(Color.fromRGBO(213, 62, 79, 1)),
                      _buildColorCircle(Color.fromRGBO(244, 109, 67, 1)),
                      _buildColorCircle(Color.fromRGBO(253, 174, 97, 1)),
                      _buildColorCircle(Color.fromRGBO(161, 133, 61, 1.0)),
                      _buildColorCircle(Color.fromRGBO(122, 147, 0, 1.0)),
                      _buildColorCircle(Color.fromRGBO(143, 0, 162, 1.0)),
                      _buildColorCircle(Color.fromRGBO(102, 194, 165, 1)),
                      _buildColorCircle(Color.fromRGBO(50, 136, 189, 1)),
                      _buildColorCircle(Color.fromRGBO(94, 79, 162, 1)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveColor,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: btnFontColor,
                      backgroundColor: btnBackgroundColor,
                    ),
                    child: const Text('Save new color'),
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
          padding: const EdgeInsets.all(3.0),
          decoration: const BoxDecoration(
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