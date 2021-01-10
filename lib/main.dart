import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meetup_hh_website/utils/googleapis.dart';
import 'app.dart';
import 'theme.dart';

void main() {
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

    return MaterialApp(
      title: 'Flutter Demo',
      theme: FMHTheme.themeData,
      home: App(),
    );
  }
}
