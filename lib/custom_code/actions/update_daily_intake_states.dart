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

Future<void> updateDailyIntakeStates(
  DateTime date,
  DocumentReference userRef,
) async {
  // Initialize the app state variables
  FFAppState().dProtein = 0.0;
  FFAppState().dCarbohydrates = 0.0;
  FFAppState().dFiber = 0.0;
  FFAppState().dSugars = 0.0;
  FFAppState().sSalt = 0.0;
  FFAppState().dFats = 0.0;
  FFAppState().dCalories = 0.0;
  FFAppState().dNawodnienie = 0.0;

  DateTime start = DateTime(date.year, date.month, date.day);
  DateTime end = start.add(Duration(days: 1));

  try {
    print('Fetching meals for user: ${userRef.path}, date: $start to $end');

    QuerySnapshot mealSnapshot = await FirebaseFirestore.instance
        .collection('Meals')
        .where('user', isEqualTo: userRef)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .get();

    print('Found ${mealSnapshot.docs.length} meal(s)');

    for (var mealDoc in mealSnapshot.docs) {
      QuerySnapshot nutrientSnapshot =
          await mealDoc.reference.collection('nutrient').get();
      for (var nutrientDoc in nutrientSnapshot.docs) {
        final data = nutrientDoc.data() as Map<String, dynamic>?;
        print('Nutrient data: $data');
        if (data != null) {
          FFAppState().dProtein += data['protein'] ?? 0.0;
          FFAppState().dCarbohydrates += data['carbohydrates'] ?? 0.0;
          FFAppState().dFiber += data['fiber'] ?? 0.0;
          FFAppState().dSugars += data['sugars'] ?? 0.0;
          FFAppState().sSalt += data['salt'] ?? 0.0;
          FFAppState().dFats += data['fats'] ?? 0.0;
          FFAppState().dCalories += data['calories'] ?? 0.0;
          FFAppState().dNawodnienie += data['water'] ?? 0.0;
        }
      }
    }

    // Round the app state variables to 2 decimal places
    FFAppState().dProtein =
        double.parse((FFAppState().dProtein).toStringAsFixed(2));
    FFAppState().dCarbohydrates =
        double.parse((FFAppState().dCarbohydrates).toStringAsFixed(2));
    FFAppState().dFiber =
        double.parse((FFAppState().dFiber).toStringAsFixed(2));
    FFAppState().dSugars =
        double.parse((FFAppState().dSugars).toStringAsFixed(2));
    FFAppState().sSalt = double.parse((FFAppState().sSalt).toStringAsFixed(2));
    FFAppState().dFats = double.parse((FFAppState().dFats).toStringAsFixed(2));
    FFAppState().dCalories =
        double.parse((FFAppState().dCalories).toStringAsFixed(2));
    FFAppState().dNawodnienie =
        double.parse((FFAppState().dNawodnienie).toStringAsFixed(2));

    print(
        'Updated app state: Protein=${FFAppState().dProtein}, Carbohydrates=${FFAppState().dCarbohydrates}, Fiber=${FFAppState().dFiber}, Sugars=${FFAppState().dSugars}, Salt=${FFAppState().sSalt}, Fats=${FFAppState().dFats}, Calories=${FFAppState().dCalories}, Nawodnienie=${FFAppState().dNawodnienie}');
  } catch (e) {
    print('Error fetching data: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
