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

Future<DocumentReference?> saveMealsDataIfNotExists(
  DocumentReference userRef,
  DateTime date,
) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    String dateString = date.toIso8601String().split('T')[0];
    print(
        'Checking for existing meal for date: $dateString and user: $userRef');

    QuerySnapshot existingMeals = await firestore
        .collection('Meals')
        .where('user', isEqualTo: userRef)
        .where('date',
            isEqualTo:
                Timestamp.fromDate(DateTime(date.year, date.month, date.day)))
        .get();

    DocumentReference mealDocRef;

    if (existingMeals.docs.isEmpty) {
      print('No existing meal found, creating new document.');
      mealDocRef = firestore.collection('Meals').doc();
      await mealDocRef.set({
        'date': Timestamp.fromDate(DateTime(date.year, date.month, date.day)),
        'user': userRef,
      });
    } else {
      print('Existing meal found, using existing document.');
      mealDocRef = existingMeals.docs.first.reference;
    }

    return mealDocRef;
  } catch (e) {
    print('Error saving data to Firestore: $e');
    return null;
  }
}
