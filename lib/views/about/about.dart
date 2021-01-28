import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../shared/fmh_view_base/fmh_view_base.dart';
import 'dart:js' as js;

// ignore: prefer_single_quotes
const String _content = """
`you_wanted_to_know_more.dart`

## Additional information and stuff that doesn't fit into the other pages

**Links**

The open-source repo for this website/webapp: [https://github.com/FlutterMeetupHH/flutter_meetup_hh_website](https://github.com/FlutterMeetupHH/flutter_meetup_hh_website)
""";

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FMHViewBase(
      children: [
        SizedBox(
          height: 800,
          child: Markdown(
            data: _content,
            selectable: true,
            onTapLink: (param1, param2, param3) {
              print(param1);
              print(param2);
              print(param3);
              js.context.callMethod('open', [param1]);
            },
            styleSheet: MarkdownStyleSheet(textScaleFactor: 1.5),
          ),
        ),
      ],
    );
  }
}
