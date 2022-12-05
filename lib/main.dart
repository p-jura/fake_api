import 'package:fake_api/services/titles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    create: (_) => TitlesFromJson(),
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
  @override
  void initState() {
    TitlesFromJson().loadTitles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TitlesFromJson>(builder: (context, value, _) {
      var text = value.appTitles;

      return MaterialApp(
        title: text?[_TITLE] != null ? (text![_TITLE]) : 'title did not loaded',
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              text?[_TITLE] != null ? (text![_TITLE]) : 'title did not loaded',
            ),
          ),
          body: ListView.builder(
            itemBuilder: ((context, index) {
              return ListTile(
                dense: true,
                leading: Text(text?[_EMPTYPAGE] != null
                    ? (text![_EMPTYPAGE])
                    : 'title did not loaded'),
              );
            }),
          ),
        ),
      );
    });
  }
}
