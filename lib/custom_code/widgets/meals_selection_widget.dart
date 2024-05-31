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

import 'package:cloud_firestore/cloud_firestore.dart';
import '/custom_code/actions/index.dart'; // Adjust the import path
import '/auth/firebase_auth/auth_util.dart';

class MealsSelectionWidget extends StatefulWidget {
  const MealsSelectionWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  _MealsSelectionWidgetState createState() => _MealsSelectionWidgetState();
}

class _MealsSelectionWidgetState extends State<MealsSelectionWidget> {
  List<DocumentReference> selectedMeals = [];

  @override
  Widget build(BuildContext context) {
    final user = currentUserReference;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wybierz posiłki'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showRemoveDialog(context);
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Meals')
            .where('user', isEqualTo: user)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Wystąpił błąd: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var meals = snapshot.data!.docs;

          if (meals.isEmpty) {
            return Center(child: Text('Brak posiłków do wyświetlenia.'));
          }

          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              var mealDoc = meals[index];
              return StreamBuilder<QuerySnapshot>(
                stream: mealDoc.reference.collection('nutrient').snapshots(),
                builder: (context, nutrientSnapshot) {
                  if (nutrientSnapshot.hasError) {
                    return Center(
                        child:
                            Text('Wystąpił błąd: ${nutrientSnapshot.error}'));
                  }

                  if (!nutrientSnapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  var nutrients = nutrientSnapshot.data!.docs;

                  if (nutrients.isEmpty) {
                    return ListTile(
                      title: Text(
                          'Brak posiłków do wyświetlenia w dokumencie ${mealDoc.id}.'),
                    );
                  }

                  return Column(
                    children: nutrients.map((nutrient) {
                      return ListTile(
                        title: Text(nutrient['name'] ?? 'Brak nazwy'),
                        selected: selectedMeals.contains(nutrient.reference),
                        onTap: () {
                          setState(() {
                            if (selectedMeals.contains(nutrient.reference)) {
                              selectedMeals.remove(nutrient.reference);
                            } else {
                              selectedMeals.add(nutrient.reference);
                            }
                          });
                        },
                      );
                    }).toList(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Usuń wybrane posiłki'),
          content: Text('Czy na pewno chcesz usunąć wybrane posiłki?'),
          actions: [
            TextButton(
              child: Text('Anuluj'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Usuń'),
              onPressed: () {
                _removeSelectedMeals();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _removeSelectedMeals() async {
    await removeSelectedMeals(selectedMeals);
    setState(() {
      selectedMeals.clear();
    });
  }
}
