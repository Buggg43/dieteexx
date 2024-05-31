import '/backend/api_requests/api_calls.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/menufolder/daily_activity_tracker_nutrition/daily_activity_tracker_nutrition_widget.dart';
import '/components/menufolder/data_bar/data_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_widget.dart' show MenuWidget;
import 'package:flutter/material.dart';

class MenuModel extends FlutterFlowModel<MenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (barcodeget)] action in ScanerIconButton widget.
  ApiCallResponse? apiResultgy5;
  // Stores action output result for [Custom Action - saveMealsDataIfNotExists] action in ScanerIconButton widget.
  DocumentReference? mealDocRef;
  // Model for DataBar component.
  late DataBarModel dataBarModel;
  // Model for DailyActivityTrackerNutrition component.
  late DailyActivityTrackerNutritionModel dailyActivityTrackerNutritionModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    dataBarModel = createModel(context, () => DataBarModel());
    dailyActivityTrackerNutritionModel =
        createModel(context, () => DailyActivityTrackerNutritionModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dataBarModel.dispose();
    dailyActivityTrackerNutritionModel.dispose();
    drawerModel.dispose();
  }
}
