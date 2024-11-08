import 'package:flutter/material.dart';
import '../utils/styleguide.dart';


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
        Expanded(child: Divider(),)
      ],
    );
  }
}
