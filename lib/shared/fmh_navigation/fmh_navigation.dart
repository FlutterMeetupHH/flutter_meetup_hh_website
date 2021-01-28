import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/stores/shared/navigation.dart';

import 'navigation_entry.dart';

class FMHNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationEntry(view: View.landing),
        SizedBox(height: 12.0),
        NavigationEntry(view: View.events),
        // SizedBox(height: 12.0),
        // NavigationEntry(view: View.files),
        SizedBox(height: 12.0),
        NavigationEntry(view: View.about),
      ],
    );
  }
}
