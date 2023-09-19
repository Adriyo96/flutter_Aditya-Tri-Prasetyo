import 'package:flutter/cupertino.dart';
import 'package:platform_widget_layout/cupertino_page.dart';

class CupertinoMyApp extends StatelessWidget {

  final _themeDart = const CupertinoThemeData.raw(
    Brightness.dark,
    null,
    null,
    null,
    null,
    null,
    null,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // theme: ThemeData.dark(),
      theme: _themeDart,
      home: HomePage(),
    );
  }
}
