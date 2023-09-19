import 'package:flutter/material.dart';
import 'package:platform_widget_layout/material_page.dart';
import 'favorite_page.dart';

class MaterialMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: FavoritePage(),
    );
  }
}
