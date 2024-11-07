import '/components/menufolder/dark_and_light_mode/dark_and_light_mode_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'drawer_widget.dart' show DrawerWidget;
import 'package:flutter/material.dart';

class DrawerModel extends FlutterFlowModel<DrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DarkAndLightMode component.
  late DarkAndLightModeModel darkAndLightModeModel;

  @override
  void initState(BuildContext context) {
    darkAndLightModeModel = createModel(context, () => DarkAndLightModeModel());
  }

  @override
  void dispose() {
    darkAndLightModeModel.dispose();
  }
}
