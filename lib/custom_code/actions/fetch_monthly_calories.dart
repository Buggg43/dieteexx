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

Future<void> fetchMonthlyCalories(
    DocumentReference userRef, DateTime date) async {
  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
  DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

  List<double> dailyCalories = [];
  List<DateTime> dates = [];

  try {
    for (int day = 0; day < lastDayOfMonth.day; day++) {
      DateTime date = firstDayOfMonth.add(Duration(days: day));
      DateTime nextDay = date.add(Duration(days: 1));

      double totalCalories = 0.0;

      QuerySnapshot mealsSnapshot = await FirebaseFirestore.instance
          .collection('Meals')
          .where('user', isEqualTo: userRef)
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(date))
          .where('date', isLessThan: Timestamp.fromDate(nextDay))
          .get();

      for (var mealDoc in mealsSnapshot.docs) {
        QuerySnapshot nutrientsSnapshot =
            await mealDoc.reference.collection('nutrient').get();
        for (var nutrientDoc in nutrientsSnapshot.docs) {
          totalCalories += nutrientDoc['calories'] ?? 0.0;
        }
      }

      dailyCalories.add(totalCalories);
      dates.add(date);
    }

    FFAppState().ddCalories = dailyCalories;
    FFAppState().dates = dates;
  } catch (e) {
    print('Error fetching calories: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
