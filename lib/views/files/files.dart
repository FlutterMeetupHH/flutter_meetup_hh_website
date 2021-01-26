import 'package:flutter/material.dart';

import '../../shared/fmh_view_base/fmh_view_base.dart';
import '../../utils/googleapis.dart';

class FilesView extends StatefulWidget {
  @override
  _FilesViewState createState() => _FilesViewState();
}

class _FilesViewState extends State<FilesView> {
  Future<List<dynamic>> _gdriveFiles;

  @override
  void initState() {
    super.initState();
    _gdriveFiles = GoogleApis.getGDriveFiles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _gdriveFiles,
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> allFiles = snapshot.data;
            return FMHViewBase(
              children: allFiles.map((file) {
                return ListTile(
                  leading: Icon(Icons.file_copy),
                  title: Text(file.name),
                  onTap: () => GoogleApis.startDownload(file),
                );
              }).toList(),
            );
          }
        }
      },
    );
  }
}
