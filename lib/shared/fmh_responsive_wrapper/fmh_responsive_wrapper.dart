import 'package:flutter/material.dart';

const double kMobileDisplayBreakpoint = 760.0;

enum Display {
  mobile,
  desktop,
}

class FMHResponsiveWrapper extends StatefulWidget {
  final Widget Function(Display) responsiveBuilder;

  FMHResponsiveWrapper({@required this.responsiveBuilder});

  @override
  _FMHResponsiveWrapperState createState() => _FMHResponsiveWrapperState();
}

class _FMHResponsiveWrapperState extends State<FMHResponsiveWrapper> {
  Display _currentDisplay;

  void _updateDisplay() => _currentDisplay =
      MediaQuery.of(context).size.width <= kMobileDisplayBreakpoint
          ? Display.mobile
          : Display.desktop;

  @override
  Widget build(BuildContext context) {
    _updateDisplay();
    return this.widget.responsiveBuilder(_currentDisplay);
  }
}
