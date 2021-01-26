import 'package:flutter/services.dart';
import 'package:googleapis/analytics/v3.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';

import 'helper.dart';

const _SCOPES = [DriveApi.DriveReadonlyScope];

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

  static Future<void> startDownload(File file,
      {String convertToType, bool includeFolders = false}) async {
    final String serviceAccount =
        await rootBundle.loadString('assets/jsons/gcloud_service_account.json');

    final ServiceAccountCredentials credentials =
        ServiceAccountCredentials.fromJson(serviceAccount);

    final AutoRefreshingAuthClient client =
        await clientViaServiceAccount(credentials, _SCOPES);

    final DriveApi drive = DriveApi(client);

    final Media downloadable = await drive.files.export(
        file.id, convertToType ?? 'application/pdf',
        downloadOptions: DownloadOptions.FullMedia) as Media;

    final String fileName =
        file.name + (convertToType != null ? '.txt' : '.pdf');

    Helper.saveToFile(downloadable, fileName);
  }
}
