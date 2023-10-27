import 'package:flutter/material.dart';
import 'theme_text_style.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'About Me',
            style: ThemeTextStyle().m3HeadlineSmall,
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(48.0),
              child: CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
            Center(
              child: Text('Aditya Tri Prasetyo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            Center(
              child: Text('Mahasiswa Teknik Informatika Universitas Riau',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
    );
  }
}