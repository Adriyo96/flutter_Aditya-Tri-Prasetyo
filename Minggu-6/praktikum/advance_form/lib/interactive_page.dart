import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class InteractivePage extends StatefulWidget {
  const InteractivePage({super.key});

  @override
  State<InteractivePage> createState() => _InteractivePageState();
}

class _InteractivePageState extends State<InteractivePage> {
  DateTime _dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();

  Color _currentColor = Colors.orange;

  FilePickerResult? result;

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(onPressed: () {}, child: const Text('Select'))
          ],
        ),
        // Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
        Text('$_dueDate'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Interactive Widgets'),
          centerTitle: true,
        ),
        body: ListView(children: [
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
          SizedBox(height: 15),
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
          SizedBox(height: 15),
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
          )
        ]));
  }
}
