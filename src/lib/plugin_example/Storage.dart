
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


//use to save different data into different file
//unfinished
class Storage {
  Future<String> get _localPath async {
    final _path = await getTemporaryDirectory();
    return _path.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/Filter.txt');
  }

  Future<String> readAcc() async {
    try {
      final file = await _localFile;
      var contents = await file.readAsString();
      print('$contents');
      return contents;
    } catch (e) {
      return null;
    }
  }

  Future<File> writeAccZ(accZAfterFirst) async {
    final file = await _localFile;
    return file.writeAsString('$accZAfterFirst');
  }
}






