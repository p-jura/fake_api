import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum TitlesPage { mainPage, personPage }

class TitlesFromJson extends ChangeNotifier {
  static const _CFG = 'cfg';
  static const _TITLES = 'titles.json';

  static TitlesFromJson? _instance;

  // ignore: non_constant_identifier_names
  String _appTitleKey;
  Map<String, dynamic>? _appTitles;

  static TitlesFromJson get instance {
    return _instance!;
  }

  Map<String, dynamic>? get appTitles => _appTitles;

  TitlesFromJson._(this._appTitles, this._appTitleKey);
  factory TitlesFromJson() {
    if (_instance == null) {
      _instance = TitlesFromJson._({}, "mainPage");

      log("TITLES INITIALIZATION");
    }
    return _instance!;
  }

  Future<void> loadTitles() async {
    String jsonAppTitles = await rootBundle.loadString('$_CFG/$_TITLES');
    final jsonDecoded = json.decode(jsonAppTitles)[_appTitleKey];
    _appTitles?.addAll(jsonDecoded);
    notifyListeners();
  }

  Future<void> setTitles({required TitlesPage titlesPage}) async {
    if (titlesPage == TitlesPage.mainPage) {
      _appTitleKey = 'mainPage';
    }
    if (titlesPage == TitlesPage.personPage) {
      _appTitleKey = 'personPage';
    }
    await loadTitles();
    notifyListeners();
  }
}
