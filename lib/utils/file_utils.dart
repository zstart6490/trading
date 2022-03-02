import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<File?> saveFile(
    Uint8List data,
    String fileName,
    String extension,
  ) async {
    final Directory contractPath = await getApplicationDocumentsDirectory();
    try {
      final dir = await contractPath.create();
      final File file = File("${dir.path}/$fileName.$extension");
      await file.writeAsBytes(data);
      return file;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
