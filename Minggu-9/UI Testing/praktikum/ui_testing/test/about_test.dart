import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_app/about_page.dart';

void main() {
  testWidgets('Cek Avatar', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: AboutPage(),
    ));
    expect(find.byWidgetPredicate((widget) => widget is CircleAvatar && widget.backgroundImage == const AssetImage('assets/images/avatar.png')), findsOneWidget);
  });

  testWidgets('Cek Nama', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: AboutPage(),
    ));
    expect(find.text('Aditya Tri Prasetyo'), findsOneWidget);
  });

  testWidgets('Cek Status', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: AboutPage(),
    ));
    expect(find.text('Mahasiswa Teknik Informatika Universitas Riau'), findsOneWidget);
    
  });
}
