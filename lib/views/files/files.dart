import 'package:flutter/material.dart';

import '../../shared/fmh_view_base/fmh_view_base.dart';
import '../../utils/googleapis.dart';

class FilesView extends StatefulWidget {
  @override
  _FilesViewState createState() => _FilesViewState();
}

class _FilesViewState extends State<FilesView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: GoogleApis.getGDriveFiles(),
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
                print(file);
                return ListTile(
                  leading: Icon(Icons.file_copy),
                  title: Text(file.name),
                );
              }).toList(),
            );
          }
        }
      },
    );
  }
}
