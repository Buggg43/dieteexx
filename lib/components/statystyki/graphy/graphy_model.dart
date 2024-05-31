import '/components/statystyki/waga/waga_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'graphy_widget.dart' show GraphyWidget;
import 'package:flutter/material.dart';

class GraphyModel extends FlutterFlowModel<GraphyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Waga component.
  late WagaModel wagaModel;

  @override
  void initState(BuildContext context) {
    wagaModel = createModel(context, () => WagaModel());
  }

  @override
  void dispose() {
    wagaModel.dispose();
  }
}
