import 'package:dio/dio.dart';

class MeetupApi {
  static Future<List<dynamic>> getAllEvents() async {
    final String url =
        'https://cors-anywhere.herokuapp.com/https://api.meetup.com/Hamburg-Flutter-and-Beyond/events?status=past,upcoming&desc=true';
    final Response response = await Dio().get(url);
    return response.data;
  }
}
