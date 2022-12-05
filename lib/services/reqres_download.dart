import 'dart:developer';

class ReqresDownloadFromeApi {
  static final ReqresDownloadFromeApi _instance = ReqresDownloadFromeApi._();

  ReqresDownloadFromeApi._();

  factory ReqresDownloadFromeApi() {
    log('INITIALIZATION');
    return _instance;
  }
  


}
