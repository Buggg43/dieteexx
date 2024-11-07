import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'waga_model.dart';
export 'waga_model.dart';

class WagaWidget extends StatefulWidget {
  const WagaWidget({
    super.key,
    bool? parameter1,
  }) : parameter1 = parameter1 ?? true;

  final bool parameter1;

  @override
  State<WagaWidget> createState() => _WagaWidgetState();
}

class _WagaWidgetState extends State<WagaWidget> {
  late WagaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WagaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WAGA_COMP_Waga_ON_INIT_STATE');
      logFirebaseEvent('Waga_custom_action');
      await actions.fetchMonthlyCalories(
        currentUserReference!,
        getCurrentTimestamp,
      );
    });

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
      alignment: const AlignmentDirectional(0.0, 0.0),
    );
  }
}
