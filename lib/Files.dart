import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Pass {
  var name, code;

  Pass(this.name, this.code);

  Pass.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        code = json['code'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
      };
}

class FileStorage {
  Future<String> getPath() async {
    final directory = await getApplicationDocumentsDirectory();
    final folder = Directory(directory.path + '/passes');
    await folder.create();
    return folder.path;
  }

  Future<bool> fileExists(String fileName) async {
    return (await getFile(fileName)).existsSync();
  }

  Future<File> getFile(String file) async {
    final path = await getPath();

    return File('$path/$file');
  }

  Future<List<String>> listFiles() async {
    final directory = await getApplicationDocumentsDirectory();
    final folder = Directory(directory.path + '/passes');
    final files = folder.listSync();
    return files.map((file) => file.path).toList();
  }

  Future<void> deleteFile(String fileName) async {
    final file = await getFile(fileName);
    await file.delete();
  }

  Future<String> readFile(String fileName) async {
    try {
      final file = await getFile(fileName);

      // Read the file
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return 'error';
    }
  }

  Future<File> writeFile(Pass data, String fileName) async {
    final file = await getFile(fileName);
    // Write the file
    return file.writeAsString(json.encode(data.toJson()));
  }
}
