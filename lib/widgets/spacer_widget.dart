import 'package:flutter/cupertino.dart';
import '../utils/styleguide.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacingSmall,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: appSecondaryColor,
              width: 0.0,
            ),
          ),
        ),
      ),
    );
  }
}