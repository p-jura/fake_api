import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

class LoadFromJson {
  static const String _DEFOULTPATH = "cfg/config.json";
  static LoadFromJson? _instance;
  static String? _path;
  Map<String, dynamic>? _data;

  LoadFromJson._(String path) {
    _path = path;
  }

  factory LoadFromJson({required String path}) {
    log('initialization');
    return _instance ??= LoadFromJson._(path);
  }

  static LoadFromJson get instance {
    LoadFromJson(path: _path ??= _DEFOULTPATH);
    return _instance!;
  }

  Future<Map<String, dynamic>> get data async {
    await loadData();
    return _data!;
  }

  Future<void> loadData([String? path]) async {
    _path = path ??= _path;
    String json = await rootBundle.loadString(_path ??= _DEFOULTPATH);
    _data = jsonDecode(json);
  }
}
