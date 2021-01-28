import 'package:flutter/material.dart';

import '../fmh_responsive_wrapper/fmh_responsive_wrapper.dart';

class FMHMeetupTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FMHResponsiveWrapper(responsiveBuilder: (Display current) {
      final TextStyle headline3 = Theme.of(context).textTheme.headline3;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Flutter Hamburg'.toUpperCase(),
            style: headline3.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize:
                  headline3.fontSize * (current == Display.mobile ? 0.5 : 1.0),
            ),
          ),
          Text(
            'and Beyond'.toUpperCase(),
            style: headline3.copyWith(
              fontSize:
                  headline3.fontSize * (current == Display.mobile ? 0.5 : 1.0),
            ),
          ),
        ],
      );
    });
  }
}
