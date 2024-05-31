import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? addplus1day(DateTime? currentdata) {
  // i need to have +1 day on click on date time
  if (currentdata != null) {
    return currentdata.add(Duration(days: 1));
  } else {
    return null;
  }
}

DateTime? functionminus1day(DateTime? currentdataminus) {
  // i need to have -1 day on click on date time
  if (currentdataminus == null) return null;
  return currentdataminus.subtract(Duration(days: 1));
}

double? calculateFiberRequirements(
  DateTime dateOfBirth,
  double weight,
  Gender gender,
  double height,
) {
  // Calculate age
  double age = DateTime.now().difference(dateOfBirth).inDays / 365;

  // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
  double bmr;
  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  // Calculate daily fiber requirements based on total calorie intake
  // Recommended fiber intake is typically around 14 grams per 1000 calories consumed
  double totalCalories = bmr; // Assuming total calories from BMR
  double fiberRequirements =
      (totalCalories / 1000) * 14; // Calculate fiber requirements

  // Round the fiberRequirements to two decimal places
  fiberRequirements = double.parse(fiberRequirements.toStringAsFixed(2));

  return fiberRequirements;
}

double? calculateSaltsRequirements(
  DateTime dateOfBirth,
  double weight,
  Gender gender,
  double height,
) {
  // Calculate age
  double age = DateTime.now().difference(dateOfBirth).inDays / 365;

  // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
  double bmr;
  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  // Calculate daily salt requirements
  double saltRequirements = 5.0; // Recommended daily salt intake in grams

  // If you want to ensure a maximum of two decimal places for consistency:
  saltRequirements = double.parse(saltRequirements.toStringAsFixed(2));

  return saltRequirements;
}

double? calculateFatsRequirements(
  DateTime dateOfBirth,
  double weight,
  Gender gender,
  double height,
) {
  // Calculate age
  double age = DateTime.now().difference(dateOfBirth).inDays / 365;

  // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
  double bmr;
  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  // Calculate daily fat requirements
  double fatsRequirements = bmr * 0.3; // 30% of total calories from fats

  // Round fatsRequirements to two decimal places
  fatsRequirements = double.parse(fatsRequirements.toStringAsFixed(2));

  return fatsRequirements;
}

double? calculateCarbohydratesRequirements(
  DateTime dateOfBirth,
  double weight,
  Gender gender,
  double height,
) {
  // Calculate age
  double age = DateTime.now().difference(dateOfBirth).inDays / 365;

  // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
  double bmr;
  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  // Calculate daily carbohydrate requirements
  double carbohydratesRequirements =
      bmr * 0.5; // 50% of total calories from carbohydrates

  // Round carbohydratesRequirements to two decimal places
  carbohydratesRequirements =
      double.parse(carbohydratesRequirements.toStringAsFixed(2));

  return carbohydratesRequirements;
}

double? calculateSugarsRequirements(
  DateTime dateOfBirth,
  double weight,
  Gender gender,
  double height,
) {
  // Calculate age
  double age = DateTime.now().difference(dateOfBirth).inDays / 365;

  // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
  double bmr;
  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  // Calculate daily sugars requirements
  double sugarsRequirements = 50.0; // Recommended daily sugars intake in grams

  // If you want to ensure a maximum of two decimal places for consistency:
  sugarsRequirements = double.parse(sugarsRequirements.toStringAsFixed(2));

  return sugarsRequirements;
}

DateTime? pickeddate(DateTime? currentdate) {
  // user chosses date from date picker and then it is stored
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentdate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != currentdate) {
      selectedDate = picked;
    }
  }

  return selectedDate;
}

double? doublecalculateCalorieRequirement(
  DateTime dateOfBirth,
  double weight,
  double targetWeight,
  Gender gender,
  double height,
) {
  // Calculate age
  double age = DateTime.now().difference(dateOfBirth).inDays / 365;

  // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
  double bmr;
  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  // Calculate calorie requirement considering weight reduction or increase goal
  double calorieRequirement;
  if (targetWeight > weight) {
    // If the goal is weight increase, add calories
    calorieRequirement = bmr * 1.2; // Assumption: light physical activity
  } else if (targetWeight < weight) {
    // If the goal is weight reduction, subtract calories
    calorieRequirement = bmr * 0.8; // Assumption: light physical activity
  } else {
    // If the goal is weight maintenance, keep BMR
    calorieRequirement = bmr;
  }

  // Return the calculated calorie requirement
  return double.parse(calorieRequirement.toStringAsFixed(2));
  ;
}

double? calculateWaterConsumption(
  DateTime dateOfBirth,
  double weight,
  Gender gender,
  double height,
) {
  // Calculate age
  double age = DateTime.now().difference(dateOfBirth).inDays / 365;

  // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
  double bmr;
  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  // Calculate water consumption
  // Recommendation: 30-35 milliliters of water per kilogram of body weight per day
  double waterConsumption = (weight * 30) / 1000; // Convert grams to liters

  // If you want to ensure a maximum of two decimal places for consistency:
  waterConsumption = double.parse(waterConsumption.toStringAsFixed(2));

  // Return the calculated water consumption
  return waterConsumption;
}

double? calculateProteinRequirements(
  DateTime dateOfBirth,
  double weight,
  Gender gender,
  double height,
) {
  // Calculate age
  double age = DateTime.now().difference(dateOfBirth).inDays / 365;

  // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
  double bmr;
  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  // Calculate daily protein requirements
  double proteinRequirements =
      weight * 0.8; // 0.8 grams per kilogram of body weight

  return proteinRequirements;
}

int? convertstringtoint(String? textmsgtoint) {
  // function that converts string to int and returns int
  try {
    return int.parse(textmsgtoint!);
  } catch (e) {
    return null;
  }
}

DateTime convertFromTXTtoDateTime(String stringdata) {
  // convert text formated d/m/y in to date time format
  final format = DateFormat('d/M/y');
  final date = format.parse(stringdata);
  return date;
}

DateTime? todatetimefromtext(String text) {
  DateTime? parseDate(String text) {
    List<String> parts = text.split('/'); // Split the text by '/'
    if (parts.length == 3) {
      try {
        int day = int.parse(parts[0]); // Extract day
        int month = int.parse(parts[1]); // Extract month
        int year = int.parse(parts[2]); // Extract year

        DateTime dateTime = DateTime(year, month, day);
        return dateTime; // Return the parsed DateTime
      } catch (e) {
        print("Error parsing date: $e");
        return null; // Return null to indicate error
      }
    } else {
      print("Invalid date format");
      return null; // Return null to indicate error
    }
  }
}

Gender? parseGender(String? plec) {
  // i neet to convert string to enum gender
  return deserializeEnum<Gender>(plec);
}

double sumProteinsForDay(
  DateTime date,
  DocumentReference userRef,
) {
  // sum of protein from a day clooected form firebase
  double sum = 0.0;
  DateTime start = DateTime(date.year, date.month, date.day);
  DateTime end = start.add(Duration(days: 1));

  userRef
      .collection('meals')
      .where('dateTime', isGreaterThanOrEqualTo: start)
      .where('dateTime', isLessThan: end)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      sum += doc.data()['protein'] ?? 0.0;
    });
  });

  return sum;
}

MealStruct transformMealData(
  dynamic apiData,
  double quantity,
) {
  print('API Data: $apiData');
  print('Quantity: $quantity');

  // Convert energy from kJ to kcal
  double convertEnergy(double kJ) => kJ / 4.18;

  // Extract and transform the data
  return MealStruct(
    name: apiData['product']['brands'] ?? 'Unknown',
    protein: (apiData['product']['nutriments']['proteins_100g'] ?? 0.0) *
        (quantity / 100),
    carbohydrates:
        (apiData['product']['nutriments']['carbohydrates_100g'] ?? 0.0) *
            (quantity / 100),
    fiber: (apiData['product']['nutriments']['fiber_100g'] ?? 0.0) *
        (quantity / 100),
    fats: (apiData['product']['nutriments']['fat_100g'] ?? 0.0) *
        (quantity / 100),
    sugars: (apiData['product']['nutriments']['sugars_100g'] ?? 0.0) *
        (quantity / 100),
    salt: (apiData['product']['nutriments']['salt_100g'] ?? 0.0) *
        (quantity / 100),
    calories:
        convertEnergy(apiData['product']['nutriments']['energy_100g'] ?? 0.0) *
            (quantity / 100),
    water:
        (apiData['product']['nutriments']['water'] ?? 0.0) * (quantity / 100),
  );
}

int convertStringToInt(String input) {
  // string covert to int
  return int.parse(input);
}

double? calculateBmi(
  double weight,
  double height,
) {
  if (weight <= 0 || height <= 0) {
    return -1; // Zwraca -1, jeśli dane wejściowe są nieprawidłowe
  }
  height = height / 100;
  // Oblicz BMI
  double bmi = weight / (height * height);

  return bmi;
}

bool validateBarcode(String barcode) {
  String sanitizedBarcode = barcode.replaceAll(RegExp(r'[^0-9]'), '');

  // Sprawdź, czy długość kodu kreskowego wynosi 13 znaków
  if (sanitizedBarcode.length != 13) {
    return false;
  }

  int sum = 0;

  // Iteracja przez cyfry
  for (int i = 0; i < 12; i++) {
    int digit = int.parse(sanitizedBarcode[i]);

    if (i % 2 == 0) {
      sum += digit; // Dodaj cyfry na pozycjach parzystych (0, 2, 4, ...)
    } else {
      sum += digit * 3; // Mnożenie cyfr na pozycjach nieparzystych przez 3
    }
  }

  // Oblicz kontrolną cyfrę
  int checkDigit = (10 - (sum % 10)) % 10;

  // Sprawdź, czy kontrolna cyfra jest zgodna
  if (checkDigit == int.parse(sanitizedBarcode[12])) {
    return true;
  } else
    return false;
}

int sanitizeBarcode(String barcode) {
  // Usunięcie wszystkich białych znaków (spacje, tabulacje, nowe linie itp.)
  String sanitizedBarcode = barcode.replaceAll(RegExp(r'\s+'), '');

  // Usunięcie wszystkich nie-numerycznych znaków (wszystko poza cyframi 0-9)
  sanitizedBarcode = sanitizedBarcode.replaceAll(RegExp(r'[^0-9]'), '');

  // Przetworzenie na int lub zwrócenie 0, jeśli nie można przetworzyć
  return int.tryParse(sanitizedBarcode) ?? 0;
}

bool checkIfNot0(double? liczba) {
  // funkcja zwracająca true lub sprawdzająca czy liczba jest większa od zera i nie jest null
  return liczba != null && liczba > 0;
}
