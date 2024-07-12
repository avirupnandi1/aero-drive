import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:mime/mime.dart';

class FirebaseService {
  uploadFile(String foldername) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      for (File file in files) {
        // Getting the fileType
        String? fileType = lookupMimeType(file.path);
        String end = "/";
        int startIndex = 0;
        int endIndex = fileType!.indexOf(end);
        String filteredFileType = fileType.substring(startIndex, endIndex);

        // Filtering file name and extension
        String fileName = file.path.split('/').last;
        String fileExtension = fileName.substring(fileName.indexOf('.') + 1);
      }
    }
  }
}
