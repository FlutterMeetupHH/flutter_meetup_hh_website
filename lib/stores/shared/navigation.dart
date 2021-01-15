import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/views/events/events.dart';

import '../../views/files/files.dart';
import '../../views/landing/landing.dart';

import 'dart:html' as html;

enum View {
  landing,
  events,
  files,
  about,
}

extension ViewFunctions on View {
  String get url => const {
        View.landing: '/',
        View.events: '/events',
        View.files: '/files',
        View.about: '/about',
      }[this];

  String get text => const {
        View.landing: 'Home',
        View.events: 'Events',
        View.files: 'Files',
        View.about: 'About',
      }[this];

  Widget get widget => {
        View.landing: LandingView(),
        View.events: EventsView(),
        View.files: FilesView(),
        View.about: LandingView(),
      }[this];
}

class NavigationStore extends InheritedWidget {
  final ValueNotifier<View> currentView = ValueNotifier(View.landing);

  NavigationStore({Key key, @required Widget child})
      : super(key: key, child: child) {
    html.window.onChange.listen((event) {
      print(event);
    });
    html.window.onHashChange.listen((event) {
      print(event);
    });
  }

  static NavigationStore of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<NavigationStore>();

  @override
  bool updateShouldNotify(NavigationStore oldWidget) => true;

  void updateCurrentView(View view) => this.currentView.value = view;
}
