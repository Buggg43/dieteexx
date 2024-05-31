import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/statystyki/legenda_waga/legenda_waga_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
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
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: widget.parameter1,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: AuthUserStreamWidget(
                      builder: (context) => StreamBuilder<List<NutrientRecord>>(
                        stream: queryNutrientRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<NutrientRecord> columnChartNutrientRecordList =
                              snapshot.data!;
                          return SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            child: custom_widgets.ColumnChart(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.9,
                              dCalories: FFAppState().ddCalories,
                              neededCalories: valueOrDefault<double>(
                                functions.doublecalculateCalorieRequirement(
                                    currentUserDocument!.dateOfBirth!,
                                    valueOrDefault(
                                        currentUserDocument?.weight, 0.0),
                                    valueOrDefault(
                                        currentUserDocument?.targetWeight, 0.0),
                                    currentUserDocument!.gender!,
                                    valueOrDefault(
                                        currentUserDocument?.height, 0.0)),
                                0.0,
                              ),
                              dates: FFAppState().dates,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.legendaWagaModel,
                  updateCallback: () => setState(() {}),
                  child: const LegendaWagaWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
