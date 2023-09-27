import 'package:advance_form/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:advance_form/button_widget.dart';
import 'package:advance_form/contact_model.dart';
import 'package:advance_form/header_contact_page.dart';
import 'package:advance_form/text_field_widget.dart';
import 'package:advance_form/theme_color.dart';
import 'package:advance_form/theme_text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class ContactPage extends StatefulWidget {
  static const routeName = 'contact_page';

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

  DateTime _dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();

  Color _currentColor = Colors.orange;

  FilePickerResult? result;

  void userNameValidation(String value) {
    if (_nameValue.isEmpty) {
      messageErrorNameValue = "Nama tidak boleh kosong!";
    } else if (_nameValue.length <= 2) {
      messageErrorNameValue = "Nama harus lebih dari 2 huruf!";
    } else {
      messageErrorNameValue = null;
    }
    setState(() {});
  }

  void userPhoneValidation(String value) {
    if (_phoneValue.isEmpty) {
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
      date: _dueDate,
      color: _currentColor,
      fileName: result?.files.first.name ?? "-",
    ));
    resetField();
    setState(() {});
  }

  void removeContact(int index) {
    contactModel.removeAt(index);
    setState(() {});
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  int selectIndexContact = -1;

  void updateContact(int index) {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contactModel[index] = ContactModel(
        name: _nameValue,
        phone: _phoneValue,
        date: _dueDate,
        color: _currentColor,
        fileName: result?.files.first.name ?? "-",
      );
      resetField();
      index = -1;
      setState(() {});
    }
  }

  void resetField() {
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
        backgroundColor: ThemeColor().avatarColor,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date'),
                  TextButton(
                      onPressed: () async {
                        final selectDate = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2050),
                        );

                        if (selectDate != null) {
                          _dueDate = selectDate;
                          currentDate = selectDate;
                          setState(() {});
                        }
                      },
                      child: const Text(
                        'Select',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
              // Text('$_dueDate'),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Color'),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: double.infinity,
                color: _currentColor,
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_currentColor),
                  ),
                  child: const Text(
                    'Pick Color',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Pick Your Color'),
                            content: BlockPicker(
                              pickerColor: _currentColor,
                              onColorChanged: (color) {
                                setState(() {
                                  _currentColor = color;
                                });
                              },
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Save'))
                            ],
                          );
                        });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Pick Files'),
              const SizedBox(height: 10),
              Center(
                child: Text(result?.files.first.name ?? "-"),
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Pick and Open File'),
                  onPressed: () async {
                    final resultFile = await FilePicker.platform.pickFiles();

                    if (resultFile != null) {
                      result = resultFile;
                    } else {
                      result = null;
                    }

                    setState(() {});
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: 'Submit',
                  onPressed: _nameValue.isNotEmpty && _phoneValue.isNotEmpty
                      ? () {
                          if (selectIndexContact == -1) {
                            addContact();
                          } else {
                            updateContact(selectIndexContact);
                          }
                          print(_nameValue);
                          print(_phoneValue);
                          print('$_dueDate');
                          print('$_currentColor');
                          print(result?.files.first.name ?? "-");
                        }
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 49,
          ),
          Text(
            'List Contact',
            style: ThemeTextStyle().m3HeadlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),
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
                        child: Text('A'),
                      ),
                      title: Text(data.name),
                      subtitle: Text('phone = ' + data.phone+'\n'+'date = '+data.date.toString()+'\n'+'color = '+data.color.toString()+'\n'+'file name = '+data.fileName, style: TextStyle(fontSize: 11),),
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
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const GalleryPage(),
        //     )),
        onPressed: () =>
            Navigator.pushReplacementNamed(context, GalleryPage.routeName),
        backgroundColor: ThemeColor().listColor,
        child: const Icon(Icons.image),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
