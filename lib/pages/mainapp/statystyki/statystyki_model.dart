import '/components/menufolder/dark_and_light_mode/dark_and_light_mode_widget.dart';
import '/components/statystyki/legenda_waga/legenda_waga_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'statystyki_widget.dart' show StatystykiWidget;
import 'package:flutter/material.dart';

class StatystykiModel extends FlutterFlowModel<StatystykiWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for legendaWaga component.
  late LegendaWagaModel legendaWagaModel;
  // Model for DarkAndLightMode component.
  late DarkAndLightModeModel darkAndLightModeModel;

  @override
  void initState(BuildContext context) {
    legendaWagaModel = createModel(context, () => LegendaWagaModel());
    darkAndLightModeModel = createModel(context, () => DarkAndLightModeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    legendaWagaModel.dispose();
    darkAndLightModeModel.dispose();
  }
}
