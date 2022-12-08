import 'package:fake_api/services/fromeJson/load_frome_json.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LoadFromJson sut1;
  late LoadFromJson sut2;
  String _PATH = 'cfg/titles.json';
  String _TESTKEY = 'reqresApi';
  group('Testing emty singleton', () {
    setUp(() {
      sut1 = LoadFromJson(path: _PATH);
      sut2 = LoadFromJson(path: _PATH);
    });
    test('Testing singleton class, TitlesFromJson without parameters', () {
      expect(sut1, sut2);
    });
  });
  group('Testing static singleton', () {
    setUp(() {
      sut1 = LoadFromJson.instance;
      sut2 = LoadFromJson.instance;
    });
    test('static instaciation', () {
      expect(sut1, sut2);
    });
    test('testing data getter', () async {
      Map data = await sut1.data;
      expect(data.containsKey(_TESTKEY), true);
    });
  });
}
