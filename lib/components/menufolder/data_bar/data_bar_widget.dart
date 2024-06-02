import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'data_bar_model.dart';
export 'data_bar_model.dart';

class DataBarWidget extends StatefulWidget {
  const DataBarWidget({
    super.key,
    bool? dataSelected,
    this.datacurent,
  }) : dataSelected = dataSelected ?? false;

  final bool dataSelected;
  final DateTime? datacurent;

  @override
  State<DataBarWidget> createState() => _DataBarWidgetState();
}

class _DataBarWidgetState extends State<DataBarWidget>
    with TickerProviderStateMixin {
  late DataBarModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DATA_BAR_COMP_DataBar_ON_INIT_STATE');
      logFirebaseEvent('DataBar_update_component_state');
      _model.datestate = getCurrentTimestamp;
      _model.updatePage(() {});
      logFirebaseEvent('DataBar_update_app_state');
      FFAppState().dataselected = _model.datestate;
      FFAppState().update(() {});
    });

    animationsMap.addAll({
      'iconButtonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 35.0,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('DATA_BAR_COMP_LeftIconButton_ON_TAP');
                      logFirebaseEvent('LeftIconButton_update_component_state');
                      _model.datestate =
                          functions.functionminus1day(_model.datestate);
                      logFirebaseEvent('LeftIconButton_custom_action');
                      await actions.updateDailyIntakeStates(
                        functions.functionminus1day(_model.datestate)!,
                        currentUserReference!,
                      );
                      logFirebaseEvent('LeftIconButton_update_app_state');
                      FFAppState().dataselected = functions
                          .functionminus1day(FFAppState().dataselected);
                      FFAppState().update(() {});
                    },
                  ).animateOnActionTrigger(
                    animationsMap['iconButtonOnActionTriggerAnimation1']!,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('DATA_BAR_COMP_DatesetContainer_ON_TAP');
                      logFirebaseEvent('DatesetContainer_date_time_picker');
                      final datePickedDate = await showDatePicker(
                        context: context,
                        initialDate: (_model.datestate ?? DateTime.now()),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2050),
                        builder: (context, child) {
                          return wrapInMaterialDatePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            headerForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            headerTextStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            pickerBackgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            pickerForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            selectedDateTimeBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            selectedDateTimeForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            actionButtonForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            iconSize: 24.0,
                          );
                        },
                      );

                      if (datePickedDate != null) {
                        safeSetState(() {
                          _model.datePicked = DateTime(
                            datePickedDate.year,
                            datePickedDate.month,
                            datePickedDate.day,
                          );
                        });
                      }
                      logFirebaseEvent('DatesetContainer_custom_action');
                      await actions.updateDailyIntakeStates(
                        _model.datestate!,
                        currentUserReference!,
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Text(
                                  dateTimeFormat('d/M/y', _model.datestate),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('DATA_BAR_COMP_RightIconButton_ON_TAP');
                    logFirebaseEvent('RightIconButton_update_component_state');
                    _model.datestate = functions.addplus1day(_model.datestate);
                    logFirebaseEvent('RightIconButton_custom_action');
                    await actions.updateDailyIntakeStates(
                      functions.addplus1day(_model.datestate)!,
                      currentUserReference!,
                    );
                    logFirebaseEvent('RightIconButton_update_app_state');
                    FFAppState().dataselected =
                        functions.addplus1day(FFAppState().dataselected);
                    FFAppState().update(() {});
                  },
                ).animateOnActionTrigger(
                  animationsMap['iconButtonOnActionTriggerAnimation2']!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
