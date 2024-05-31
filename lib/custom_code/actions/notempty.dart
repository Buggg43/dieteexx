// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> notempty(
  String dateOfBirth,
  double height,
  double weight,
  double targetWeight,
  Gender gender,
) async {
  // check if user set his date of birth, height,weight,targeted weight and gender and then retur bolean
  if (dateOfBirth != null &&
      height != null &&
      weight != null &&
      targetWeight != null &&
      gender != null) {
    return true;
  } else {
    return false;
  }
}
