import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/stores/shared/navigation.dart';

import 'dart:html' as html;

class NavigationEntry extends StatelessWidget {
  final View view;

  NavigationEntry({@required this.view});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 172.0,
      child: RaisedButton(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Text(
          this.view.text,
          style: Theme.of(context).textTheme.headline5,
        ),
        onPressed: () {
          html.window.history.pushState(null, view.text, view.url);
          NavigationStore.of(context).updateCurrentView(view);
          // GoogleApis.startDownload();
        },
      ),
    );
  }
}
