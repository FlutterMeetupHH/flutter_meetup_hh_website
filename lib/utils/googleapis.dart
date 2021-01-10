import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:flutter_meetup_hh_website/utils/save_to_file.dart';
import 'package:googleapis/analytics/v3.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:path_provider/path_provider.dart';

const _SCOPES = const [DriveApi.DriveReadonlyScope];

class GoogleApis {
  static Future<List<File>> getGDriveFiles(
      {bool includeFolders = false}) async {
    final String serviceAccount =
        await rootBundle.loadString('assets/jsons/gcloud_service_account.json');

    final ServiceAccountCredentials credentials =
        ServiceAccountCredentials.fromJson(serviceAccount);

    final AutoRefreshingAuthClient client =
        await clientViaServiceAccount(credentials, _SCOPES);

    final DriveApi drive = DriveApi(client);
    final FileList files = await drive.files.list($fields: '*');

    return includeFolders
        ? files.files
        : files.files
            .where((file) => !file.mimeType.contains('.folder'))
            .toList();
  }

  static Future<void> startDownload({bool includeFolders = false}) async {
    final String serviceAccount =
        await rootBundle.loadString('assets/jsons/gcloud_service_account.json');

    final ServiceAccountCredentials credentials =
        ServiceAccountCredentials.fromJson(serviceAccount);

    final AutoRefreshingAuthClient client =
        await clientViaServiceAccount(credentials, _SCOPES);

    final DriveApi drive = DriveApi(client);
    final FileList files = await drive.files.list($fields: '*');

    final String idOfFirst = files.files
        .where((file) => !file.mimeType.contains('.folder'))
        .toList()
        .first
        .id;

    print(idOfFirst);

    Media file = await drive.files.export(idOfFirst, 'text/plain',
        downloadOptions: DownloadOptions.FullMedia);

    Stuff.saveToFile(file);
  }
}
