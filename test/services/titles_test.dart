import 'package:fake_api/services/titles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TitlesFromJson sut1;
  late TitlesFromJson sut2;
  group('Testing emty singleton', () {
    setUp(() {
      sut1 = TitlesFromJson();
      sut2 = TitlesFromJson();
    });
    test('Testing singleton class, TitlesFromJson without parameters', () {
      expect(sut1, sut2);
    });
  });
  group('Testing singleton parameters', () {
    setUp(() async {
      sut1 = TitlesFromJson();
      sut2 = TitlesFromJson();
      await sut1.loadTitles();
      await sut2.loadTitles();
    });
    test('With key value', () {
      expect(sut1.appTitles?.length, sut2.appTitles?.length);
      expect(sut1.appTitles?.values.toList(), sut2.appTitles?.values.toList());
      expect(sut1.appTitles?['title'], "Reqres API Demo App");
    });
    test('changeing tiltes', () async {
      await sut1.setTitles(titlesPage: TitlesPage.personPage);
      expect(sut1.appTitles?['title'], "Persons Page");
    });
  });
}
