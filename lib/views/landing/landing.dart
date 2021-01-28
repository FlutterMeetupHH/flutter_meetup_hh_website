import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../shared/fmh_view_base/fmh_view_base.dart';

// ignore: prefer_single_quotes
const String _content = """
![Test](../../../assets/images/header.jpg)

## This is the official homepage for all things meetup!

We want to use and grow this website as a one-stop-shop for our continuing investment in the Flutter world (and what lies beyond).

Here you will find all the information about upcoming events and can also check out past ones.

You will have access to all files used in the talks and presentations, so:

- Slides
- Source Code
- Cat gifs
- .. and more!

All for you presented in a convenient overview and easy to download.

The aim also is to continue developing this page as it was (you may have guessed!) with Flutter Web in the beta version. This means we want to regularly revisit the project and based future talks and other on this "living subject".
""";

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FMHViewBase(
      children: [
        Markdown(
          data: _content,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          styleSheet: MarkdownStyleSheet(
            textScaleFactor: 1.2,
            blockSpacing: 18.0,
          ),
        ),
      ],
    );
  }
}
