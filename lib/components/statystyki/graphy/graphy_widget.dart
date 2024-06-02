import '/components/statystyki/waga/waga_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'graphy_model.dart';
export 'graphy_model.dart';

class GraphyWidget extends StatefulWidget {
  const GraphyWidget({
    super.key,
    bool? parameter1,
    bool? parameter2,
  })  : parameter1 = parameter1 ?? false,
        parameter2 = parameter2 ?? true;

  final bool parameter1;
  final bool parameter2;

  @override
  State<GraphyWidget> createState() => _GraphyWidgetState();
}

class _GraphyWidgetState extends State<GraphyWidget> {
  late GraphyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: wrapWithModel(
        model: _model.wagaModel,
        updateCallback: () => setState(() {}),
        child: const WagaWidget(
          parameter1: false,
        ),
      ),
    );
  }
}
