import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/shared/fmh_responsive_wrapper/fmh_responsive_wrapper.dart';

import '../../stores/shared/navigation.dart';

class NavigationEntry extends StatelessWidget {
  final View view;

  NavigationEntry({@required this.view});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 172.0,
      child: FMHResponsiveWrapper(responsiveBuilder: (Display current) {
        return RaisedButton(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          onPressed: () {
            html.window.history.pushState(null, view.text, view.url);
            NavigationStore.of(context).updateCurrentView(view);
            if (current == Display.mobile) {
              Navigator.of(context).pop();
            }
          },
          child: Text(
            this.view.text,
            style: Theme.of(context).textTheme.headline6,
          ),
        );
      }),
    );
  }
}
