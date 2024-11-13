import 'package:flutter/material.dart';
import '../../utils/styleguide.dart';

class NameSettings extends StatelessWidget {
  const NameSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change your Name'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [ Center(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Here you can change your name.\n'
                    'Your current Name is: \n NAME', // TODO -> Name
                style: TextStyle(fontSize: 16, color: fontColor),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'New Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Save new Name Logic
                  print('Save new Name BTN pressed');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: paddingNormal, horizontal: paddingSmall),
                  foregroundColor: btnFontColor,
                  backgroundColor: btnBackgroundColor,
                ),
                child: const Text('Save new Name'),
              ),
            ],
          ),
        ),
      ),
    ]
    )
    );
  }
}
