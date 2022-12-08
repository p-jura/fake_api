import 'package:fake_api/services/reqres_download.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReqresDownloadFromeApi sut1;
  late ReqresDownloadFromeApi sut2;

  setUp(() async {
    sut1 = await ReqresDownloadFromeApi.instance;
    sut2 = await ReqresDownloadFromeApi.instance;
  });

  test('Testing Singleton class equality', () {
    expect(sut1, sut2);
  });
}
