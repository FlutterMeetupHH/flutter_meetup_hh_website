import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/utils/googleapis.dart';

import 'navigation_entry.dart';

class FMHNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () => GoogleApis.startDownload(),
            child: NavigationEntry(text: 'Home')),
        SizedBox(height: 12.0),
        NavigationEntry(text: 'Meetups'),
        SizedBox(height: 12.0),
        NavigationEntry(text: 'About'),
      ],
    );
  }
}
