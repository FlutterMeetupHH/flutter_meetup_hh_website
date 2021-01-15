import 'dart:convert';

import 'package:flutter/services.dart';

class MeetupApi {
  static Future<List<dynamic>> getAllEvents() async {
    return json.decode(
            await rootBundle.loadString('assets/jsons/meetup_events.json'))
        as List<dynamic>;
  }
}
