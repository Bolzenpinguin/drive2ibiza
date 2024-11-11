import 'package:drive2ibiza/pages/settings/color_settings.dart';
import 'package:flutter/material.dart';
import '../../utils/styleguide.dart';
import 'package:intl/intl.dart';
import '../../widgets/spacer_widget.dart';
import 'group_settings.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

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
                // TODO Variable für Namen einbauen
                Text('Hallo Kurt!', style: TextStyle(fontSize: 24)),

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
                            onTap: () {
                              // TODO: BTN für Namensänderung implementieren
                              print('Button for Name Change Pressed!');
                            },
                            child: Text(
                              'Kurt',
                              style: TextStyle(color: linkFontColor),
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ColorSettings(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
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
                              // TODO: BTN für Namensänderung implementieren
                              print('Button for Group Change Pressed!');
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

                // Spacer
                SpacerWidget(),

                ElevatedButton(
                  onPressed: () {
                    // TODO Abspeichern hinzufügen -> Brauch ich das eigentlich??
                    print('Save Settings BTN pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    //padding: const EdgeInsets.symmetric(vertical: paddingNormal),
                    foregroundColor: btnFontColor,
                    backgroundColor: btnBackgroundColor,
                  ),
                  child: Text('Save Settings'),
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