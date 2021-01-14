import 'package:flutter_meetup_hh_website/stores/shared/navigation.dart';

class Helper {
  static View fromURL(String url) => const {
        '/': View.landing,
        '/events': View.events,
        '/files': View.files,
        '/about': View.about,
      }[url];
}
