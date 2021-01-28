import 'dart:convert';
import 'dart:html';

import 'package:googleapis/drive/v3.dart' as v3;

import '../stores/shared/navigation.dart';

class Helper {
  static View fromURL(String url) => const {
        '/': View.landing,
        '/events': View.events,
        '/files': View.files,
        '/about': View.about,
        '/contributors': View.contributors,
      }[url];

  static void saveToFile(v3.Media media, String fileName) {
    final List<int> dataStore = [];
    media.stream.listen((data) {
      dataStore.insertAll(dataStore.length, data);
    }, onDone: () async {
      final String content = base64Encode(dataStore);

      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,$content')
        ..setAttribute('download', fileName)
        ..click();
    }, onError: (error) {
      print('Some Error');
    });
  }
}
