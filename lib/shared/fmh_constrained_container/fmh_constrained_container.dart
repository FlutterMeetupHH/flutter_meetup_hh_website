import 'package:flutter/material.dart';

const kResponsiveWrapperWidth = 1280.0;

class FMHConstraintedContainer extends StatelessWidget {
  final Widget child;

  const FMHConstraintedContainer({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Align(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: kResponsiveWrapperWidth,
          ),
          child: SizedBox(
            width: double.infinity,
            child: this.child,
          ),
        ),
      ),
    );
  }
}
