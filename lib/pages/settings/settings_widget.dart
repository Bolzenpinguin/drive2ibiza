import 'package:drive2ibiza/pages/settings/settings_color.dart';
import 'package:drive2ibiza/pages/settings/settings_name.dart';
import 'package:flutter/material.dart';
import '../../utils/styleguide.dart';
import 'package:intl/intl.dart';
import '../../widgets/spacer_widget.dart';
import 'settings_group.dart';
import 'package:drive2ibiza/utils/user_prefs.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  Color userColor = appPrimaryColor; // Default color

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

  Future<void> _refreshUserName() async {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(marginSmall),
            padding: const EdgeInsets.all(paddingSmall),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                FutureBuilder<String?>(
                  future: UserPrefs.getUserName(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text("Error loading name", style: TextStyle(fontSize: 24));
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Text("Hello!", style: TextStyle(fontSize: 24));
                    }
                    return Text('Hello ${snapshot.data}!', style: TextStyle(fontSize: 24));
                  },
                ),

                // Spacer
                SizedBox(height: spacingSmall,),

                // Driver Name Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Driver Name'),
                    SizedBox(
                      width: settingsBoxWidth,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: paddingSmall, vertical: paddingSmall),
                        decoration: BoxDecoration(
                          color: btnGreyBackground,
                          borderRadius: BorderRadius.circular(borderRadiusSmall),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              bool? result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NameSettings(),
                                ),
                              );
                              if (result == true) {
                                _refreshUserName();
                              }
                            },
                            child: FutureBuilder<String?>(
                              future: UserPrefs.getUserName(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasError) {
                                  return Text("Error loading Name", style: TextStyle(color: linkFontColor));
                                }
                                if (!snapshot.hasData || snapshot.data == null) {
                                  return Text("-", style: TextStyle(color: linkFontColor));
                                }
                                return Text('${snapshot.data}', style: TextStyle(color: linkFontColor));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Spacer
                SpacerWidget(),

                // Driver Color Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Driver Color'),
                    SizedBox(
                      width: settingsBoxWidth,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: paddingSmall, vertical: paddingSmall),
                        decoration: BoxDecoration(
                          color: btnGreyBackground,
                          borderRadius: BorderRadius.circular(borderRadiusSmall),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                bool? result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ColorSettings(),
                                  ),
                                );
                                if (result == true) {
                                  _loadUserColor();
                                }
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: userColor,
                                  border: Border.all(
                                    color: appPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Spacer
                SpacerWidget(),

                // Driver Group Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Driver Group'),
                    SizedBox(
                      width: settingsBoxWidth,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: paddingSmall, vertical: paddingSmall),
                        decoration: BoxDecoration(
                          color: btnGreyBackground,
                          borderRadius: BorderRadius.circular(borderRadiusSmall),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const GroupSettings(),
                                ),
                              );
                            },
                            child: Text(
                              '-',
                              style: TextStyle(color: linkFontColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Copyright Text
        Padding(
          padding: const EdgeInsets.only(bottom: paddingBig),
          child: Text(
            'Copyright © ${DateFormat.y().format(DateTime.now())} Kurt Schubert',
            style: TextStyle(
              fontSize: copyrightLabel,
              color: secondaryFontColor,
            ),
          ),
        ),
      ],
    );
  }
}