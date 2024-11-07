import 'package:flutter/material.dart';
import 'package:drive2ibiza/pages/settings/settings_widget.dart';
import '../../utils/styleguide.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: fontColor),
        ),
        centerTitle: true,
        backgroundColor: appNavBarColor,
      ),
      body: SettingsWidget(),
    );
  }
}