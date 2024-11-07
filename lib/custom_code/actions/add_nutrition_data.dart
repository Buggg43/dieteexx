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

Future<void> addNutritionData(DocumentReference mealDocRef,
    List<dynamic> apiData, double quantity) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Przelicz wartości odżywcze na podstawie podanej ilości
    for (var meal in apiData) {
      if (meal != null) {
        print('Adding nutrition for meal: ${meal['name']}');
        await mealDocRef.collection('nutrient').add({
          'name': meal['name'] ?? 'Unknown',
          'protein': (meal['proteins_100g'] ?? 0) * (quantity / 100),
          'carbohydrates': (meal['carbohydrates_100g'] ?? 0) * (quantity / 100),
          'fiber': (meal['fiber'] ?? 0) * (quantity / 100),
          'fats': (meal['fat_100g'] ?? 0) * (quantity / 100),
          'sugars': (meal['sugars_100g'] ?? 0) * (quantity / 100),
          'salt': (meal['salt_100g'] ?? 0) * (quantity / 100),
          'calories': (meal['energy_100g'] ?? 0) * (quantity / 100),
          'water': meal.containsKey('water')
              ? (meal['water'] ?? 0) * (quantity / 100)
              : null,
        });
        print('Nutrition added for meal: ${meal['name']}');
      } else {
        print('Skipping null meal entry.');
      }
    }
  } catch (e) {
    print('Error adding nutrition data to Firestore: $e');
  }
}
