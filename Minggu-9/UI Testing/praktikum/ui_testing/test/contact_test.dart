// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_app/button_widget.dart';
import 'package:form_app/contact_page.dart';
import 'package:form_app/text_field_widget.dart';

void main() {
  testWidgets('Judul Halaman harus Contact', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(find.text('Contact'), findsOneWidget);
  });

  testWidgets('Cek Header Contact Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(find.byIcon(Icons.mobile_friendly_rounded), findsOneWidget);
    expect(find.text('Create New Contact'), findsOneWidget);
    expect(
        find.text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.'),
        findsOneWidget);
  });

  testWidgets('Cek Elemen Input', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextFieldWidget && widget.label == 'Name'),
        findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextFieldWidget && widget.label == 'Number'),
        findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextButton && widget.child is Text),
        findsOneWidget);
    expect(find.text('Color'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Pick Color'), findsOneWidget);
    expect(find.widgetWithText(Column, 'Pick Files', skipOffstage: false),
        findsOneWidget);
    expect(
        find.widgetWithText(ElevatedButton, 'Pick and Open File',
            skipOffstage: false),
        findsOneWidget);
    expect(find.widgetWithText(ButtonWidget, 'Submit', skipOffstage: false),
        findsOneWidget);
  });

  testWidgets('Cek Header Contact Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(find.byIcon(Icons.mobile_friendly_rounded), findsOneWidget);
    expect(find.text('Create New Contact'), findsOneWidget);
    expect(
        find.text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.'),
        findsOneWidget);
  });

  testWidgets('Tes Input', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    await tester.enterText(
        find.byWidgetPredicate(
            (widget) => widget is TextFieldWidget && widget.label == 'Name'),
        'Adriyo');
    await tester.enterText(
        find.byWidgetPredicate(
            (widget) => widget is TextFieldWidget && widget.label == 'Number'),
        '081234567890');

    await tester.ensureVisible(find.widgetWithText(ButtonWidget, 'Submit', skipOffstage: false));
    await tester.pumpAndSettle();
    // Tap the add button.
    await tester
        .tap(find.widgetWithText(ButtonWidget, 'Submit', skipOffstage: false));
    // Rebuild the widget after the state has changed.
    await tester.pump();
    expect(
        find.widgetWithText(ListTile, 'Adriyo', skipOffstage: false),
        findsOneWidget);
  });
}
