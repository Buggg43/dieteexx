// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealStruct extends FFFirebaseStruct {
  MealStruct({
    String? name,
    double? protein,
    double? carbohydrates,
    double? fiber,
    double? fats,
    double? sugars,
    double? salt,
    double? calories,
    double? water,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _protein = protein,
        _carbohydrates = carbohydrates,
        _fiber = fiber,
        _fats = fats,
        _sugars = sugars,
        _salt = salt,
        _calories = calories,
        _water = water,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "protein" field.
  double? _protein;
  double get protein => _protein ?? 0.0;
  set protein(double? val) => _protein = val;
  void incrementProtein(double amount) => _protein = protein + amount;
  bool hasProtein() => _protein != null;

  // "carbohydrates" field.
  double? _carbohydrates;
  double get carbohydrates => _carbohydrates ?? 0.0;
  set carbohydrates(double? val) => _carbohydrates = val;
  void incrementCarbohydrates(double amount) =>
      _carbohydrates = carbohydrates + amount;
  bool hasCarbohydrates() => _carbohydrates != null;

  // "fiber" field.
  double? _fiber;
  double get fiber => _fiber ?? 0.0;
  set fiber(double? val) => _fiber = val;
  void incrementFiber(double amount) => _fiber = fiber + amount;
  bool hasFiber() => _fiber != null;

  // "fats" field.
  double? _fats;
  double get fats => _fats ?? 0.0;
  set fats(double? val) => _fats = val;
  void incrementFats(double amount) => _fats = fats + amount;
  bool hasFats() => _fats != null;

  // "sugars" field.
  double? _sugars;
  double get sugars => _sugars ?? 0.0;
  set sugars(double? val) => _sugars = val;
  void incrementSugars(double amount) => _sugars = sugars + amount;
  bool hasSugars() => _sugars != null;

  // "salt" field.
  double? _salt;
  double get salt => _salt ?? 0.0;
  set salt(double? val) => _salt = val;
  void incrementSalt(double amount) => _salt = salt + amount;
  bool hasSalt() => _salt != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  set calories(double? val) => _calories = val;
  void incrementCalories(double amount) => _calories = calories + amount;
  bool hasCalories() => _calories != null;

  // "water" field.
  double? _water;
  double get water => _water ?? 0.0;
  set water(double? val) => _water = val;
  void incrementWater(double amount) => _water = water + amount;
  bool hasWater() => _water != null;

  static MealStruct fromMap(Map<String, dynamic> data) => MealStruct(
        name: data['name'] as String?,
        protein: castToType<double>(data['protein']),
        carbohydrates: castToType<double>(data['carbohydrates']),
        fiber: castToType<double>(data['fiber']),
        fats: castToType<double>(data['fats']),
        sugars: castToType<double>(data['sugars']),
        salt: castToType<double>(data['salt']),
        calories: castToType<double>(data['calories']),
        water: castToType<double>(data['water']),
      );

  static MealStruct? maybeFromMap(dynamic data) =>
      data is Map ? MealStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'protein': _protein,
        'carbohydrates': _carbohydrates,
        'fiber': _fiber,
        'fats': _fats,
        'sugars': _sugars,
        'salt': _salt,
        'calories': _calories,
        'water': _water,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'protein': serializeParam(
          _protein,
          ParamType.double,
        ),
        'carbohydrates': serializeParam(
          _carbohydrates,
          ParamType.double,
        ),
        'fiber': serializeParam(
          _fiber,
          ParamType.double,
        ),
        'fats': serializeParam(
          _fats,
          ParamType.double,
        ),
        'sugars': serializeParam(
          _sugars,
          ParamType.double,
        ),
        'salt': serializeParam(
          _salt,
          ParamType.double,
        ),
        'calories': serializeParam(
          _calories,
          ParamType.double,
        ),
        'water': serializeParam(
          _water,
          ParamType.double,
        ),
      }.withoutNulls;

  static MealStruct fromSerializableMap(Map<String, dynamic> data) =>
      MealStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        protein: deserializeParam(
          data['protein'],
          ParamType.double,
          false,
        ),
        carbohydrates: deserializeParam(
          data['carbohydrates'],
          ParamType.double,
          false,
        ),
        fiber: deserializeParam(
          data['fiber'],
          ParamType.double,
          false,
        ),
        fats: deserializeParam(
          data['fats'],
          ParamType.double,
          false,
        ),
        sugars: deserializeParam(
          data['sugars'],
          ParamType.double,
          false,
        ),
        salt: deserializeParam(
          data['salt'],
          ParamType.double,
          false,
        ),
        calories: deserializeParam(
          data['calories'],
          ParamType.double,
          false,
        ),
        water: deserializeParam(
          data['water'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MealStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MealStruct &&
        name == other.name &&
        protein == other.protein &&
        carbohydrates == other.carbohydrates &&
        fiber == other.fiber &&
        fats == other.fats &&
        sugars == other.sugars &&
        salt == other.salt &&
        calories == other.calories &&
        water == other.water;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        protein,
        carbohydrates,
        fiber,
        fats,
        sugars,
        salt,
        calories,
        water
      ]);
}

MealStruct createMealStruct({
  String? name,
  double? protein,
  double? carbohydrates,
  double? fiber,
  double? fats,
  double? sugars,
  double? salt,
  double? calories,
  double? water,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MealStruct(
      name: name,
      protein: protein,
      carbohydrates: carbohydrates,
      fiber: fiber,
      fats: fats,
      sugars: sugars,
      salt: salt,
      calories: calories,
      water: water,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MealStruct? updateMealStruct(
  MealStruct? meal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMealStructData(
  Map<String, dynamic> firestoreData,
  MealStruct? meal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meal == null) {
    return;
  }
  if (meal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && meal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mealData = getMealFirestoreData(meal, forFieldValue);
  final nestedData = mealData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMealFirestoreData(
  MealStruct? meal, [
  bool forFieldValue = false,
]) {
  if (meal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meal.toMap());

  // Add any Firestore field values
  meal.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMealListFirestoreData(
  List<MealStruct>? meals,
) =>
    meals?.map((e) => getMealFirestoreData(e, true)).toList() ?? [];
