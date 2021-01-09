import 'package:flutter/material.dart';

import 'navigation_entry.dart';

class FMHNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationEntry(text: 'Home'),
        SizedBox(height: 12.0),
        NavigationEntry(text: 'Meetups'),
        SizedBox(height: 12.0),
        NavigationEntry(text: 'About'),
      ],
    );
  }
}
