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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference?> fetchMealReference(
    DateTime selectedDate, DocumentReference userRef) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Convert DateTime to Timestamp for comparison
    Timestamp selectedTimestamp = Timestamp.fromDate(selectedDate);

    // Query the Meals collection to find the document for the selected date and user
    QuerySnapshot querySnapshot = await firestore
        .collection('Meals')
        .where('user', isEqualTo: userRef)
        .where('date', isEqualTo: selectedTimestamp)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // If the document exists, return the document reference
      return querySnapshot.docs.first.reference;
    } else {
      // If no document exists, return null
      return null;
    }
  } catch (e) {
    print('Error fetching meal reference: $e');
    return null;
  }
}
