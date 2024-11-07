import '/components/menufolder/dark_and_light_mode/dark_and_light_mode_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'przepisy_widget.dart' show PrzepisyWidget;
import 'package:flutter/material.dart';

class PrzepisyModel extends FlutterFlowModel<PrzepisyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DarkAndLightMode component.
  late DarkAndLightModeModel darkAndLightModeModel;

  @override
  void initState(BuildContext context) {
    darkAndLightModeModel = createModel(context, () => DarkAndLightModeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    darkAndLightModeModel.dispose();
  }
}
