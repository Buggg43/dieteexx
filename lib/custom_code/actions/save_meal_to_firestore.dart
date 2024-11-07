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

Future<void> saveMealToFirestore(
  DocumentReference mealDocRef,
  MealStruct mealData,
) async {
  try {
    print('Saving Meal Data to Firestore: ${mealData.toMap()}');
    await mealDocRef.collection('nutrient').add(mealData.toMap());
    print('Meal Data successfully saved to Firestore');
  } catch (e) {
    print('Error saving Meal Data to Firestore: $e');
  }
}
