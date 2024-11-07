import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "DateOfBirth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "Weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "Target_weight" field.
  double? _targetWeight;
  double get targetWeight => _targetWeight ?? 0.0;
  bool hasTargetWeight() => _targetWeight != null;

  // "Gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "Height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "usersetdata" field.
  bool? _usersetdata;
  bool get usersetdata => _usersetdata ?? false;
  bool hasUsersetdata() => _usersetdata != null;

  // "userMeals" field.
  DocumentReference? _userMeals;
  DocumentReference? get userMeals => _userMeals;
  bool hasUserMeals() => _userMeals != null;

  // "userNutrient" field.
  DocumentReference? _userNutrient;
  DocumentReference? get userNutrient => _userNutrient;
  bool hasUserNutrient() => _userNutrient != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _dateOfBirth = snapshotData['DateOfBirth'] as DateTime?;
    _weight = castToType<double>(snapshotData['Weight']);
    _targetWeight = castToType<double>(snapshotData['Target_weight']);
    _gender = deserializeEnum<Gender>(snapshotData['Gender']);
    _height = castToType<double>(snapshotData['Height']);
    _usersetdata = snapshotData['usersetdata'] as bool?;
    _userMeals = snapshotData['userMeals'] as DocumentReference?;
    _userNutrient = snapshotData['userNutrient'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? photoUrl,
  DateTime? dateOfBirth,
  double? weight,
  double? targetWeight,
  Gender? gender,
  double? height,
  bool? usersetdata,
  DocumentReference? userMeals,
  DocumentReference? userNutrient,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'DateOfBirth': dateOfBirth,
      'Weight': weight,
      'Target_weight': targetWeight,
      'Gender': gender,
      'Height': height,
      'usersetdata': usersetdata,
      'userMeals': userMeals,
      'userNutrient': userNutrient,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.weight == e2?.weight &&
        e1?.targetWeight == e2?.targetWeight &&
        e1?.gender == e2?.gender &&
        e1?.height == e2?.height &&
        e1?.usersetdata == e2?.usersetdata &&
        e1?.userMeals == e2?.userMeals &&
        e1?.userNutrient == e2?.userNutrient;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.photoUrl,
        e?.dateOfBirth,
        e?.weight,
        e?.targetWeight,
        e?.gender,
        e?.height,
        e?.usersetdata,
        e?.userMeals,
        e?.userNutrient
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
