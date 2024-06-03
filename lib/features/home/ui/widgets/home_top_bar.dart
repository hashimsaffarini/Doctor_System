import 'package:doctor_system/core/theming/styles.dart';
import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Hashim!',
              style: TextStyles.font18DarkBlueBold,
            )
          ],
        )
      ],
    );
  }
}
