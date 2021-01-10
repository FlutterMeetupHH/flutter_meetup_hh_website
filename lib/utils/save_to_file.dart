import 'dart:convert';
import 'dart:html';

import 'package:googleapis/drive/v3.dart' as v3;

class Stuff {
  static Future<void> saveToFile(v3.Media media) {
    List<int> dataStore = [];
    media.stream.listen((data) {
      print("DataReceived: ${data.length}");
      dataStore.insertAll(dataStore.length, data);
    }, onDone: () async {
      final content = base64Encode(dataStore);
      final anchor = AnchorElement(
          href:
              "data:application/octet-stream;charset=utf-16le;base64,$content")
        ..setAttribute("download", "file.pdf")
        ..click();
    }, onError: (error) {
      print("Some Error");
    });
  }
}
