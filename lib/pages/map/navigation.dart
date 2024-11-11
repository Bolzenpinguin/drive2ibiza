import 'package:flutter/material.dart';
import '../calendar/calendar.dart';
import 'map.dart';
import '../settings/settings.dart';

class Navigation extends StatefulWidget {
  final int currentIndex;

  const Navigation({
    required this.currentIndex,
    super.key,
  });

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late int currentPageIndex;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.currentIndex;
    pages = [
      const Calendar(),
      const MapPage(),
      const Settings(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}