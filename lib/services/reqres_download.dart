import 'dart:developer';
import 'package:http/http.dart' as http;

class ReqresDownloadFromeApi {
  static final ReqresDownloadFromeApi? _instance;

  String? _data;

  static Future<ReqresDownloadFromeApi> get instance async {
    await _instance?.load();
    return _instance ?? ReqresDownloadFromeApi._();
  }

  ReqresDownloadFromeApi._();

  load() async {
    
  }
}
