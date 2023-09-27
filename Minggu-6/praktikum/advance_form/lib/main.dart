import 'package:flutter/material.dart';
import 'package:advance_form/contact_page.dart';
import 'package:advance_form/gallery_page.dart';
import 'package:advance_form/preview_image_page.dart';
// import 'package:form_app/interactive_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const InteractivePage(),
      initialRoute: ContactPage.routeName,
      routes: {
        ContactPage.routeName: (context) => const ContactPage(),
        GalleryPage.routeName: (context) => const GalleryPage(),
        PreviewImagePage.routeName: (context) => const PreviewImagePage(),
      },
    );
  }
}
