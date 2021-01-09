import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/types/enums/content_padding.dart';

class FMHContentCard extends StatelessWidget {
  final Widget child;
  final ContentPadding padding;

  const FMHContentCard({
    @required this.child,
    this.padding = ContentPadding.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: this.padding.value),
        child: this.child,
      ),
    );
  }
}
