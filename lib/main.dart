import 'package:fake_api/services/fromeJson/load_frome_json.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider<LoadFromJson>(
    create: (_) => LoadFromJson(),
    child: const FakeApi(),
  ));
}

class FakeApi extends StatefulWidget {
  const FakeApi({super.key});

  @override
  State<FakeApi> createState() => _FakeApiState();
}

class _FakeApiState extends State<FakeApi> {
  static const _TITLE = 'title';
  static const _EMPTYPAGE = 'emptyPage';
  static const _EMPTYTITLE = 'title did not loaded';

  @override
  void initState() {
    LoadFromJson.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadFromJson>(builder: (context, value, _) {
      Map<String, dynamic>? text = value.appTitles;

      return MaterialApp(
        title: text?[_TITLE] != null ? (text![_TITLE]) : _EMPTYTITLE,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              text?[_TITLE] != null ? (text![_TITLE]) : _EMPTYTITLE,
            ),
          ),
          body: ListView.builder(
            itemBuilder: ((context, index) {
              return ListTile(
                dense: true,
                leading: Text(text?[_EMPTYPAGE] != null
                    ? (text![_EMPTYPAGE])
                    : _EMPTYTITLE),
              );
            }),
          ),
        ),
      );
    });
  }
}
