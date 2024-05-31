import '/components/statystyki/legenda_waga/legenda_waga_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'waga_widget.dart' show WagaWidget;
import 'package:flutter/material.dart';

class WagaModel extends FlutterFlowModel<WagaWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for legendaWaga component.
  late LegendaWagaModel legendaWagaModel;

  @override
  void initState(BuildContext context) {
    legendaWagaModel = createModel(context, () => LegendaWagaModel());
  }

  @override
  void dispose() {
    legendaWagaModel.dispose();
  }
}
