import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutrientRecord extends FirestoreRecord {
  NutrientRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "protein" field.
  double? _protein;
  double get protein => _protein ?? 0.0;
  bool hasProtein() => _protein != null;

  // "carbohydrates" field.
  double? _carbohydrates;
  double get carbohydrates => _carbohydrates ?? 0.0;
  bool hasCarbohydrates() => _carbohydrates != null;

  // "fiber" field.
  double? _fiber;
  double get fiber => _fiber ?? 0.0;
  bool hasFiber() => _fiber != null;

  // "fats" field.
  double? _fats;
  double get fats => _fats ?? 0.0;
  bool hasFats() => _fats != null;

  // "sugars" field.
  double? _sugars;
  double get sugars => _sugars ?? 0.0;
  bool hasSugars() => _sugars != null;

  // "salt" field.
  double? _salt;
  double get salt => _salt ?? 0.0;
  bool hasSalt() => _salt != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  // "water" field.
  double? _water;
  double get water => _water ?? 0.0;
  bool hasWater() => _water != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _protein = castToType<double>(snapshotData['protein']);
    _carbohydrates = castToType<double>(snapshotData['carbohydrates']);
    _fiber = castToType<double>(snapshotData['fiber']);
    _fats = castToType<double>(snapshotData['fats']);
    _sugars = castToType<double>(snapshotData['sugars']);
    _salt = castToType<double>(snapshotData['salt']);
    _calories = castToType<double>(snapshotData['calories']);
    _water = castToType<double>(snapshotData['water']);
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('nutrient')
          : FirebaseFirestore.instance.collectionGroup('nutrient');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('nutrient').doc(id);

  static Stream<NutrientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutrientRecord.fromSnapshot(s));

  static Future<NutrientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NutrientRecord.fromSnapshot(s));

  static NutrientRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NutrientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutrientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutrientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutrientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutrientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutrientRecordData({
  double? protein,
  double? carbohydrates,
  double? fiber,
  double? fats,
  double? sugars,
  double? salt,
  double? calories,
  double? water,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'protein': protein,
      'carbohydrates': carbohydrates,
      'fiber': fiber,
      'fats': fats,
      'sugars': sugars,
      'salt': salt,
      'calories': calories,
      'water': water,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutrientRecordDocumentEquality implements Equality<NutrientRecord> {
  const NutrientRecordDocumentEquality();

  @override
  bool equals(NutrientRecord? e1, NutrientRecord? e2) {
    return e1?.protein == e2?.protein &&
        e1?.carbohydrates == e2?.carbohydrates &&
        e1?.fiber == e2?.fiber &&
        e1?.fats == e2?.fats &&
        e1?.sugars == e2?.sugars &&
        e1?.salt == e2?.salt &&
        e1?.calories == e2?.calories &&
        e1?.water == e2?.water &&
        e1?.name == e2?.name;
  }

  @override
  int hash(NutrientRecord? e) => const ListEquality().hash([
        e?.protein,
        e?.carbohydrates,
        e?.fiber,
        e?.fats,
        e?.sugars,
        e?.salt,
        e?.calories,
        e?.water,
        e?.name
      ]);

  @override
  bool isValidKey(Object? o) => o is NutrientRecord;
}
