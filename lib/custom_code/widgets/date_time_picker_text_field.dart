// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';

class DateTimePickerTextField extends StatefulWidget {
  const DateTimePickerTextField({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<DateTimePickerTextField> createState() =>
      _DateTimePickerTextFieldState();
}

class _DateTimePickerTextFieldState extends State<DateTimePickerTextField> {
  DateTime? _selectedDateTime;

  Future<void> _openDateTimePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // button color
              onPrimary: Colors.white, // button text color
              surface: Colors.blue, // dialog background color
              onSurface: Colors.black, // dialog text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDateTime) {
      setState(() {
        _selectedDateTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    return GestureDetector(
      onTap: _openDateTimePicker,
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Select Date of Birth',
          ),
          controller: TextEditingController(
            text: _selectedDateTime != null
                ? dateFormat.format(_selectedDateTime!)
                : '',
          ),
        ),
      ),
    );
  }
}
