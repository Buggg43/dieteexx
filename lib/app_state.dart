import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _sSalt = await secureStorage.getDouble('ff_sSalt') ?? _sSalt;
    });
    await _safeInitAsync(() async {
      _isDarkMode = await secureStorage.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _barcodeValue = 5903767004036;
  int get barcodeValue => _barcodeValue;
  set barcodeValue(int value) {
    _barcodeValue = value;
  }

  double _dCalories = 0.0;
  double get dCalories => _dCalories;
  set dCalories(double value) {
    _dCalories = value;
  }

  double _dNawodnienie = 0.0;
  double get dNawodnienie => _dNawodnienie;
  set dNawodnienie(double value) {
    _dNawodnienie = value;
  }

  double _dProtein = 0.0;
  double get dProtein => _dProtein;
  set dProtein(double value) {
    _dProtein = value;
  }

  double _dFiber = 0.0;
  double get dFiber => _dFiber;
  set dFiber(double value) {
    _dFiber = value;
  }

  double _dSugars = 0.0;
  double get dSugars => _dSugars;
  set dSugars(double value) {
    _dSugars = value;
  }

  double _sSalt = 0.0;
  double get sSalt => _sSalt;
  set sSalt(double value) {
    _sSalt = value;
    secureStorage.setDouble('ff_sSalt', value);
  }

  void deleteSSalt() {
    secureStorage.delete(key: 'ff_sSalt');
  }

  double _dFats = 0.0;
  double get dFats => _dFats;
  set dFats(double value) {
    _dFats = value;
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    secureStorage.setBool('ff_isDarkMode', value);
  }

  void deleteIsDarkMode() {
    secureStorage.delete(key: 'ff_isDarkMode');
  }

  bool _ShowEnergia = true;
  bool get ShowEnergia => _ShowEnergia;
  set ShowEnergia(bool value) {
    _ShowEnergia = value;
  }

  bool _ShowWaga = false;
  bool get ShowWaga => _ShowWaga;
  set ShowWaga(bool value) {
    _ShowWaga = value;
  }

  bool _ShowWoda = false;
  bool get ShowWoda => _ShowWoda;
  set ShowWoda(bool value) {
    _ShowWoda = value;
  }

  bool _datanotnull = false;
  bool get datanotnull => _datanotnull;
  set datanotnull(bool value) {
    _datanotnull = value;
  }

  DateTime? _dataselected = DateTime.fromMillisecondsSinceEpoch(1716156000000);
  DateTime? get dataselected => _dataselected;
  set dataselected(DateTime? value) {
    _dataselected = value;
  }

  DocumentReference? _mealRef;
  DocumentReference? get mealRef => _mealRef;
  set mealRef(DocumentReference? value) {
    _mealRef = value;
  }

  bool _firstloadmenu = true;
  bool get firstloadmenu => _firstloadmenu;
  set firstloadmenu(bool value) {
    _firstloadmenu = value;
  }

  double _dCarbohydrates = 0.0;
  double get dCarbohydrates => _dCarbohydrates;
  set dCarbohydrates(double value) {
    _dCarbohydrates = value;
  }

  List<double> _ddCalories = [];
  List<double> get ddCalories => _ddCalories;
  set ddCalories(List<double> value) {
    _ddCalories = value;
  }

  void addToDdCalories(double value) {
    _ddCalories.add(value);
  }

  void removeFromDdCalories(double value) {
    _ddCalories.remove(value);
  }

  void removeAtIndexFromDdCalories(int index) {
    _ddCalories.removeAt(index);
  }

  void updateDdCaloriesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _ddCalories[index] = updateFn(_ddCalories[index]);
  }

  void insertAtIndexInDdCalories(int index, double value) {
    _ddCalories.insert(index, value);
  }

  List<DateTime> _dates = [];
  List<DateTime> get dates => _dates;
  set dates(List<DateTime> value) {
    _dates = value;
  }

  void addToDates(DateTime value) {
    _dates.add(value);
  }

  void removeFromDates(DateTime value) {
    _dates.remove(value);
  }

  void removeAtIndexFromDates(int index) {
    _dates.removeAt(index);
  }

  void updateDatesAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    _dates[index] = updateFn(_dates[index]);
  }

  void insertAtIndexInDates(int index, DateTime value) {
    _dates.insert(index, value);
  }

  int _quantity = 0;
  int get quantity => _quantity;
  set quantity(int value) {
    _quantity = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
