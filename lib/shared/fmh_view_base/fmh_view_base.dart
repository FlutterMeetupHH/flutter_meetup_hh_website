import 'package:flutter/material.dart';

import '../../app.dart';
import '../../types/enums/content_padding.dart';

class FMHViewBase extends StatelessWidget {
  final List<Widget> children;

  FMHViewBase({@required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.children.length,
      padding: EdgeInsets.only(top: kContentPadding.value),
      itemBuilder: (context, index) => this.children[index],
    );
  }
}
