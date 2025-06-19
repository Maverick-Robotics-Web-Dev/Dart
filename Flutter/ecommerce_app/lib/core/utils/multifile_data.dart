import 'dart:io';

import 'package:dio/dio.dart';

Future<MultipartFile> multiFilePart({required File file}) async {
  String fileName = file.path.split('/').last;
  final MultipartFile multipartFile = await MultipartFile.fromFile(
    file.path,
    filename: fileName,
  );
  return multipartFile;
}
