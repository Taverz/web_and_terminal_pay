import 'dart:io';

import 'package:flutter/material.dart';

import 'package:filesystem_picker/filesystem_picker.dart';

String pathStorage = _getPath();

String _getPath() {
  String plat = Platform.operatingSystem;
  switch (plat) {
    case "android":
      return "/storage/emulated/0";
    case "windows":
      return "C:/SERVICEBOOK";
    default:
      return "";
  }
}

Future<String?> pickFilePDF(BuildContext context) async {
  // if (presentationOrMockTest) {
  //   return 'https://'; //TODO:
  // }
  String? path = await FilesystemPicker.open(
    title: 'Выберите PDF файл',
    context: context,
    rootDirectory: Directory(pathStorage),
    fsType: FilesystemType.file,
    allowedExtensions: ['.pdf'],
    fileTileSelectMode: FileTileSelectMode.wholeTile,
  );
  return path;
}

Future<String?> pickFileTXT(BuildContext context) async {
  // if (presentationOrMockTest) {
  //   return 'https://'; //TODO:
  // }
  String? path = await FilesystemPicker.open(
    title: 'Выберите TXT файл',
    context: context,
    rootDirectory: Directory(pathStorage),
    fsType: FilesystemType.file,
    allowedExtensions: ['.txt'],
    fileTileSelectMode: FileTileSelectMode.wholeTile,
  );
  return path;
}

Future<String?> pickFileJSON(BuildContext context) async {
  // if (presentationOrMockTest) {
  //   return 'https://'; //TODO:
  // }
  String? path = await FilesystemPicker.open(
    title: 'Выберите TXT файл',
    context: context,
    rootDirectory: Directory(pathStorage),
    fsType: FilesystemType.file,
    allowedExtensions: ['.txt'],
    fileTileSelectMode: FileTileSelectMode.wholeTile,
  );
  return path;
}

Future<String?> pickFileIMAGE(BuildContext context) async {
  // if (presentationOrMockTest) {
  //   return 'https://'; //TODO:
  // }
  String? path = await FilesystemPicker.open(
    title: 'Выберите IMAGE ',
    context: context,
    rootDirectory: Directory(pathStorage),
    fsType: FilesystemType.file,
    allowedExtensions: ['.png', '.jpg'],
    fileTileSelectMode: FileTileSelectMode.wholeTile,
  );
  return path;
}
