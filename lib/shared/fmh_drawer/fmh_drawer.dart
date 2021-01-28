import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/shared/fmh_meetup_title/fmh_meetup_title.dart';
import 'package:flutter_meetup_hh_website/shared/fmh_navigation/fmh_navigation.dart';

class FMHDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: FMHMeetupTitle(),
          ),
          FMHNavigation(),
        ],
      ),
    );
  }
}
