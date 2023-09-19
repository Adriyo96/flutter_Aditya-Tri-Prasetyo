import 'package:flutter/material.dart';
import 'package:task_form/header_contact_page.dart';
import 'package:task_form/text_field_widget.dart';
import 'package:task_form/theme_color.dart';
import 'package:task_form/theme_text_style.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _nameValue = "";
  String _numberValue = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Contact',
          style: ThemeTextStyle().m3HeadlineSmall,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            label: 'Name',
            hintText: 'Insert Your Name',
            onChanged: (val) {
              _nameValue = val;
              print(_nameValue);
            },
          ),
          TextFieldWidget(
            label: 'Number',
            hintText: '+62 .....',
            onChanged: (val) {
              _numberValue = val;
              print(_numberValue);
            },
          ),
        ],
      ),
    );
  }
}