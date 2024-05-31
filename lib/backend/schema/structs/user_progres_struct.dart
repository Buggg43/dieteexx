// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProgresStruct extends FFFirebaseStruct {
  UserProgresStruct({
    int? wagAktualna,
    int? wagaDocelowa,
    int? wagaStartowa,
    int? licznikKaloriiDzien,
    DateTime? dzien,
    UserProgresStruct? ss,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _wagAktualna = wagAktualna,
        _wagaDocelowa = wagaDocelowa,
        _wagaStartowa = wagaStartowa,
        _licznikKaloriiDzien = licznikKaloriiDzien,
        _dzien = dzien,
        _ss = ss,
        super(firestoreUtilData);

  // "WagAktualna" field.
  int? _wagAktualna;
  int get wagAktualna => _wagAktualna ?? 0;
  set wagAktualna(int? val) => _wagAktualna = val;
  void incrementWagAktualna(int amount) => _wagAktualna = wagAktualna + amount;
  bool hasWagAktualna() => _wagAktualna != null;

  // "WagaDocelowa" field.
  int? _wagaDocelowa;
  int get wagaDocelowa => _wagaDocelowa ?? 0;
  set wagaDocelowa(int? val) => _wagaDocelowa = val;
  void incrementWagaDocelowa(int amount) =>
      _wagaDocelowa = wagaDocelowa + amount;
  bool hasWagaDocelowa() => _wagaDocelowa != null;

  // "WagaStartowa" field.
  int? _wagaStartowa;
  int get wagaStartowa => _wagaStartowa ?? 0;
  set wagaStartowa(int? val) => _wagaStartowa = val;
  void incrementWagaStartowa(int amount) =>
      _wagaStartowa = wagaStartowa + amount;
  bool hasWagaStartowa() => _wagaStartowa != null;

  // "LicznikKaloriiDzien" field.
  int? _licznikKaloriiDzien;
  int get licznikKaloriiDzien => _licznikKaloriiDzien ?? 0;
  set licznikKaloriiDzien(int? val) => _licznikKaloriiDzien = val;
  void incrementLicznikKaloriiDzien(int amount) =>
      _licznikKaloriiDzien = licznikKaloriiDzien + amount;
  bool hasLicznikKaloriiDzien() => _licznikKaloriiDzien != null;

  // "Dzien" field.
  DateTime? _dzien;
  DateTime? get dzien => _dzien;
  set dzien(DateTime? val) => _dzien = val;
  bool hasDzien() => _dzien != null;

  // "ss" field.
  UserProgresStruct? _ss;
  UserProgresStruct get ss => _ss ?? UserProgresStruct();
  set ss(UserProgresStruct? val) => _ss = val;
  void updateSs(Function(UserProgresStruct) updateFn) =>
      updateFn(_ss ??= UserProgresStruct());
  bool hasSs() => _ss != null;

  static UserProgresStruct fromMap(Map<String, dynamic> data) =>
      UserProgresStruct(
        wagAktualna: castToType<int>(data['WagAktualna']),
        wagaDocelowa: castToType<int>(data['WagaDocelowa']),
        wagaStartowa: castToType<int>(data['WagaStartowa']),
        licznikKaloriiDzien: castToType<int>(data['LicznikKaloriiDzien']),
        dzien: data['Dzien'] as DateTime?,
        ss: UserProgresStruct.maybeFromMap(data['ss']),
      );

  static UserProgresStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProgresStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'WagAktualna': _wagAktualna,
        'WagaDocelowa': _wagaDocelowa,
        'WagaStartowa': _wagaStartowa,
        'LicznikKaloriiDzien': _licznikKaloriiDzien,
        'Dzien': _dzien,
        'ss': _ss?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'WagAktualna': serializeParam(
          _wagAktualna,
          ParamType.int,
        ),
        'WagaDocelowa': serializeParam(
          _wagaDocelowa,
          ParamType.int,
        ),
        'WagaStartowa': serializeParam(
          _wagaStartowa,
          ParamType.int,
        ),
        'LicznikKaloriiDzien': serializeParam(
          _licznikKaloriiDzien,
          ParamType.int,
        ),
        'Dzien': serializeParam(
          _dzien,
          ParamType.DateTime,
        ),
        'ss': serializeParam(
          _ss,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserProgresStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserProgresStruct(
        wagAktualna: deserializeParam(
          data['WagAktualna'],
          ParamType.int,
          false,
        ),
        wagaDocelowa: deserializeParam(
          data['WagaDocelowa'],
          ParamType.int,
          false,
        ),
        wagaStartowa: deserializeParam(
          data['WagaStartowa'],
          ParamType.int,
          false,
        ),
        licznikKaloriiDzien: deserializeParam(
          data['LicznikKaloriiDzien'],
          ParamType.int,
          false,
        ),
        dzien: deserializeParam(
          data['Dzien'],
          ParamType.DateTime,
          false,
        ),
        ss: deserializeStructParam(
          data['ss'],
          ParamType.DataStruct,
          false,
          structBuilder: UserProgresStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserProgresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProgresStruct &&
        wagAktualna == other.wagAktualna &&
        wagaDocelowa == other.wagaDocelowa &&
        wagaStartowa == other.wagaStartowa &&
        licznikKaloriiDzien == other.licznikKaloriiDzien &&
        dzien == other.dzien &&
        ss == other.ss;
  }

  @override
  int get hashCode => const ListEquality().hash([
        wagAktualna,
        wagaDocelowa,
        wagaStartowa,
        licznikKaloriiDzien,
        dzien,
        ss
      ]);
}

UserProgresStruct createUserProgresStruct({
  int? wagAktualna,
  int? wagaDocelowa,
  int? wagaStartowa,
  int? licznikKaloriiDzien,
  DateTime? dzien,
  UserProgresStruct? ss,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProgresStruct(
      wagAktualna: wagAktualna,
      wagaDocelowa: wagaDocelowa,
      wagaStartowa: wagaStartowa,
      licznikKaloriiDzien: licznikKaloriiDzien,
      dzien: dzien,
      ss: ss ?? (clearUnsetFields ? UserProgresStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProgresStruct? updateUserProgresStruct(
  UserProgresStruct? userProgres, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProgres
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProgresStructData(
  Map<String, dynamic> firestoreData,
  UserProgresStruct? userProgres,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProgres == null) {
    return;
  }
  if (userProgres.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userProgres.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProgresData =
      getUserProgresFirestoreData(userProgres, forFieldValue);
  final nestedData =
      userProgresData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userProgres.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProgresFirestoreData(
  UserProgresStruct? userProgres, [
  bool forFieldValue = false,
]) {
  if (userProgres == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProgres.toMap());

  // Handle nested data for "ss" field.
  addUserProgresStructData(
    firestoreData,
    userProgres.hasSs() ? userProgres.ss : null,
    'ss',
    forFieldValue,
  );

  // Add any Firestore field values
  userProgres.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProgresListFirestoreData(
  List<UserProgresStruct>? userProgress,
) =>
    userProgress?.map((e) => getUserProgresFirestoreData(e, true)).toList() ??
    [];
