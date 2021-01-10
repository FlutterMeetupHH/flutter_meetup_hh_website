import 'package:flutter/services.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';

const _SCOPES = const [DriveApi.DriveScope];

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
    final FileList files = await drive.files.list();

    return includeFolders
        ? files.files
        : files.files
            .where((file) => !file.mimeType.contains('.folder'))
            .toList();
  }
}
