import 'package:flutter/material.dart';

import '../../shared/fmh_view_base/fmh_view_base.dart';
import '../../utils/meetupapi.dart';

class EventsView extends StatefulWidget {
  @override
  _EventsViewState createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: MeetupApi.getAllEvents(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> allEvents = snapshot.data;
            return FMHViewBase(
              children: allEvents.map((event) => Text(event['name'])).toList(),
            );
          }
        }
      },
    );
  }
}
