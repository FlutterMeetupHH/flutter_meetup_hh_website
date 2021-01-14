import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'stores/shared/navigation.dart';
import 'theme.dart';

void main() {
  setPathUrlStrategy();
  runApp(FMHApp());
}

class FMHApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // GoogleApis.getGDriveFiles().then((value) {
    //   print(value.first.toString());
    // });

    return NavigationStore(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: FMHTheme.themeData,
        routes: {}..addEntries(
            View.values.map(
              (view) => MapEntry(view.url, (_) => App()),
            ),
          ),
      ),
    );
  }
}
