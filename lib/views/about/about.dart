import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../shared/fmh_view_base/fmh_view_base.dart';

// ignore: prefer_single_quotes
const String _content = """
## Additional information

The open-source repo for this website/webapp: 

[https://github.com/FlutterMeetupHH/flutter_meetup_hh_website](https://github.com/FlutterMeetupHH/flutter_meetup_hh_website)

If you find any bugs (surely there are none, right? RIGHT?! xD), please feel free to submit them in the repo. We are grateful for any hints and support!

[https://github.com/FlutterMeetupHH/flutter_meetup_hh_website/issues](https://github.com/FlutterMeetupHH/flutter_meetup_hh_website/issues)
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
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            styleSheet: MarkdownStyleSheet(
              textScaleFactor: 1.2,
              blockSpacing: 18.0,
            ),
            onTapLink: (param1, param2, param3) {
              js.context.callMethod('open', [param1]);
            },
          ),
        ),
      ],
    );
  }
}
