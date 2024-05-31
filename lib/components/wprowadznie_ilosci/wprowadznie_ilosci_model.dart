import '/flutter_flow/flutter_flow_util.dart';
import 'wprowadznie_ilosci_widget.dart' show WprowadznieIlosciWidget;
import 'package:flutter/material.dart';

class WprowadznieIlosciModel extends FlutterFlowModel<WprowadznieIlosciWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
