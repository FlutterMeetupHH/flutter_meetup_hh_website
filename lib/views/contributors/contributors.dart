import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../../shared/fmh_view_base/fmh_view_base.dart';

//TODO: Make an extra file
class Contributor {
  final int id;
  final String login;

  Contributor({this.id, this.login});

  factory Contributor.fromJson(Map<String, dynamic> json) {
    return Contributor(
      id: json['id'],
      login: json['login'],
    );
  }
}

List<Contributor> parseContributors(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Contributor>((json) => Contributor.fromJson(json)).toList();
}

//TODO: Put it to an extra file (githubApi for example)
Future<List<Contributor>> fetchContributors() async {
  final response = await http.get(
      'https://api.github.com/repos/FlutterMeetupHH/flutter_meetup_hh_website/contributors');
  if (response.statusCode == 200) {
    // return Contributor.fromJson(jsonDecode(response.body));
    return compute(parseContributors, response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

class ContributorsView extends StatefulWidget {
  @override
  _ContributorsViewState createState() => _ContributorsViewState();
}

class _ContributorsViewState extends State<ContributorsView> {
  Future futureContributors;

  @override
  void initState() {
    super.initState();
    futureContributors = fetchContributors();
    print(futureContributors);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchContributors(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> allEvents = snapshot.data;
            return FMHViewBase(
              children: allEvents.map((event) {
                return ListTile(
                  title: Text(
                    event.login,
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
            );
          }
        }
      },
    );
  }
}
