import '/components/menufolder/dark_and_light_mode/dark_and_light_mode_widget.dart';
import '/components/statystyki/waga/waga_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'statystyki_widget.dart' show StatystykiWidget;
import 'package:flutter/material.dart';

class StatystykiModel extends FlutterFlowModel<StatystykiWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Waga component.
  late WagaModel wagaModel;
  // Model for DarkAndLightMode component.
  late DarkAndLightModeModel darkAndLightModeModel;

  @override
  void initState(BuildContext context) {
    wagaModel = createModel(context, () => WagaModel());
    darkAndLightModeModel = createModel(context, () => DarkAndLightModeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    wagaModel.dispose();
    darkAndLightModeModel.dispose();
  }
}
