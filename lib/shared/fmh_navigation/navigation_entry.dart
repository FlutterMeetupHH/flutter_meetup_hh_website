import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/utils/googleapis.dart';

class NavigationEntry extends StatelessWidget {
  final String text;

  NavigationEntry({@required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 172.0,
      child: RaisedButton(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Text(
          this.text,
          style: Theme.of(context).textTheme.headline5,
        ),
        onPressed: () => GoogleApis.startDownload(),
      ),
    );
  }
}
