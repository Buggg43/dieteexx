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

Future<List<MealStruct>?> getDailyMeals(
  DocumentReference userRef,
  DateTime date,
) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String dateString = date.toIso8601String().split('T')[0];

  try {
    // Query to get all meals for the given user and date
    QuerySnapshot mealSnapshot = await firestore
        .collection('Meals')
        .where('user', isEqualTo: userRef)
        .where('date',
            isEqualTo:
                Timestamp.fromDate(DateTime(date.year, date.month, date.day)))
        .get();

    List<MealStruct> meals = [];
    for (var doc in mealSnapshot.docs) {
      QuerySnapshot nutrientSnapshot =
          await doc.reference.collection('nutrient').get();
      for (var nutrientDoc in nutrientSnapshot.docs) {
        meals.add(
            MealStruct.fromMap(nutrientDoc.data() as Map<String, dynamic>));
      }
    }
    return meals;
  } catch (e) {
    print('Error fetching daily meals: $e');
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
