import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/app.dart';
import '../types/enums/content_padding.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [Text('LOL')];

    return ListView.builder(
      itemCount: children.length,
      padding: EdgeInsets.only(top: kContentPadding.value),
      itemBuilder: (context, index) => children[index],
    );
  }
}
