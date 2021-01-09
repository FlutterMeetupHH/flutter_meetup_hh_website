import 'package:flutter/material.dart';

class FMHMeetupTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter and Beyond',
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64.0),
          child: Text(
            'Meetup Hamburg',
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}