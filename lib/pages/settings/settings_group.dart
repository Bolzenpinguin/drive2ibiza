import 'package:flutter/material.dart';
import '../../utils/styleguide.dart';

class GroupSettings extends StatelessWidget {
  const GroupSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create or Join a Group'),
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
                'To join a group, just enter the keyword',
                style: TextStyle(fontSize: 16, color: appUnselectedIconColor),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Keyword',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Join Group Logic
                  print('Join Group BTN pressed');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: paddingNormal, horizontal: paddingSmall),
                  foregroundColor: btnFontColor,
                  backgroundColor: btnBackgroundColor,
                ),
                child: const Text('Join Group'),
              ),
              const SizedBox(height: 16),
              const OrDivider(),
              const SizedBox(height: 16),
              Text(
                'Create a group and invite people',
                style: TextStyle(fontSize: 16, color: appUnselectedIconColor),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Group Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Create Group Logic
                  print('Create Group BTN pressed');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: paddingNormal, horizontal: paddingSmall),
                  foregroundColor: btnFontColor,
                  backgroundColor: btnBackgroundColor,
                ),
                child: const Text('Create Group'),
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

// Or Divider
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingSmall),
          child: Text('Or'),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}