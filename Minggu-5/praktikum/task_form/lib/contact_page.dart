import 'package:flutter/material.dart';
import 'package:task_form/button_widget.dart';
import 'package:task_form/contact_model.dart';
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
  String _phoneValue = "";

  String? messageErrorNameValue;
  String? messageErrorPhoneValue;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  List<ContactModel> contactModel = [];

  void userNameValidation(String value) {
    if (_nameValue.isNotEmpty) {
      messageErrorNameValue = "Nama tidak boleh kosong!";
    } else if (_nameValue.length <= 2) {
      messageErrorNameValue = "Nama harus lebih dari 2 kata!";
    } else {
      messageErrorNameValue = null;
    }
    setState(() {});
  }

  void userPhoneValidation(String value) {
    if (_phoneValue.isNotEmpty) {
      messageErrorPhoneValue = "Nomor tidak boleh kosong!";
    } else if (_phoneValue.length <= 8) {
      messageErrorPhoneValue = "Nomor harus lebih dari 8 angka!";
    } else if (_phoneValue.length > 15) {
      messageErrorPhoneValue = "Nomor tidak boleh lebih dari 15 angka!";
    } else {
      messageErrorPhoneValue = null;
    }
    setState(() {});
  }

  void addContact() {
      contactModel.add(ContactModel(
        name: _nameValue,
        phone: _phoneValue,
      ));
      resetField();
      setState(() {});
    }

    void removeContact(int index){
      contactModel.removeAt(index);
      setState(() {});
    }

    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    int selectIndexContact = -1;

    void updateContact(int index){
      if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty){
        contactModel[index] = ContactModel(
          name: _nameValue,
          phone: _phoneValue,
        );
        resetField();
        index = -1;
        setState(() {});
      }
    }

    void resetField(){
      _nameController.clear();
      _phoneController.clear();
      _nameValue = "";
      _phoneValue = "";
    }

    @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            controller: _nameController,
            errorText: messageErrorNameValue,
            onChanged: (val) {
              _nameValue = val;
              userNameValidation(_nameValue);
              setState(() {});
            },
          ),
          TextFieldWidget(
            label: 'Number',
            hintText: '+62 .....',
            controller: _phoneController,
            errorText: messageErrorPhoneValue,
            textInputType: TextInputType.phone,
            onChanged: (val) {
              _phoneValue = val;
              userPhoneValidation(_phoneValue);
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: 'Submit',
                  onPressed: _nameValue.isNotEmpty && _phoneValue.isNotEmpty ? () {
                    if (selectIndexContact == -1) {
                      addContact();
                    } else {
                      updateContact(selectIndexContact);
                    }
                  }
                  : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: 49,),
          Text(
            'List Contact',
            style: ThemeTextStyle().m3HeadlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14,),
          Container(
            width: double.infinity,
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ThemeColor().listColor,
              borderRadius: BorderRadius.circular(28),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: contactModel.length,
              itemBuilder: (context, index) {
                var data = contactModel[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Text(
                      'A'
                    ),
                  ),
                  title: Text(data.name),
                  subtitle: Text(data.phone),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          _nameController.text = data.name;
                          _phoneController.text = data.phone;
                          selectIndexContact = index;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          removeContact(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}