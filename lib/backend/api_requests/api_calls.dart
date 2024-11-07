import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start barcoderead Group Code

class BarcodereadGroup {
  static String getBaseUrl() =>
      'https://world.openfoodfacts.net/api/v2/product';
  static Map<String, String> headers = {};
  static BarcodegetCall barcodegetCall = BarcodegetCall();
}

class BarcodegetCall {
  Future<ApiCallResponse> call({
    String? barcode = '',
  }) async {
    final baseUrl = BarcodereadGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'barcodeget',
      apiUrl: '$baseUrl/$barcode',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<double>? fiber(dynamic response) => (getJsonField(
        response,
        r'''$..fiber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  double? energy100g(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.energy_100g''',
      ));
  double? fat100g(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.fat_100g''',
      ));
  double? proteins100g(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.proteins_100g''',
      ));
  double? carbohydrates100g(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.carbohydrates_100g''',
      ));
  double? salt1000g(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.salt_100g''',
      ));
  double? sodium100g(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.sodium_100g''',
      ));
  double? sugars100g(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.sugars_100g''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product.brands''',
      ));
  double? water(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriscore_data.is_water''',
      ));
}

/// End barcoderead Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
