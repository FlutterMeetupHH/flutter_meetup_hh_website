import 'dart:convert';

import 'package:http/http.dart';

class MeetupApi {
  static Future<List<Map<String, dynamic>>> getAllEvents() async {
    final String url =
        'https://api.meetup.com/Hamburg-Flutter-and-Beyond/events?status=past,upcoming&desc=true';
    final Response response = await get(url);
    return json.decode(response.body);
  }
}
