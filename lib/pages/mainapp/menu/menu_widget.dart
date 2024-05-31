import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/menufolder/daily_activity_tracker_nutrition/daily_activity_tracker_nutrition_widget.dart';
import '/components/menufolder/data_bar/data_bar_widget.dart';
import '/components/menufolder/trash_can/trash_can_widget.dart';
import '/components/wprowadznie_ilosci/wprowadznie_ilosci_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Menu'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MENU_PAGE_Menu_ON_INIT_STATE');
      logFirebaseEvent('Menu_custom_action');
      await actions.updateDailyIntakeStates(
        getCurrentTimestamp,
        currentUserReference!,
      );
      if (valueOrDefault<bool>(currentUserDocument?.usersetdata, false)) {
        logFirebaseEvent('Menu_firestore_query');
        await queryNutrientRecordOnce();
      } else {
        logFirebaseEvent('Menu_navigate_to');

        context.goNamed('DaneOsoby');

        logFirebaseEvent('Menu_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: const Text('Proszę uzupełnić dane'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
      }

      logFirebaseEvent('Menu_update_app_state');
      FFAppState().dataselected = _model.dataBarModel.datestate;
      setState(() {});
      if (FFAppState().firstloadmenu) {
        logFirebaseEvent('Menu_update_app_state');
        FFAppState().dataselected = getCurrentTimestamp;
        setState(() {});
        logFirebaseEvent('Menu_update_app_state');
        FFAppState().firstloadmenu = false;
      }
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
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: SizedBox(
          width: 250.0,
          child: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: wrapWithModel(
                model: _model.drawerModel,
                updateCallback: () => setState(() {}),
                child: const DrawerWidget(),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 116.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        key: const ValueKey('ScanerIconButton_f230'),
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          key:
                                              const ValueKey('ScanerIconButton_f230'),
                                          Icons.qr_code_2,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'MENU_PAGE_ScanerIconButton_ON_TAP');
                                          if (true) {
                                            if (true) {
                                              logFirebaseEvent(
                                                  'ScanerIconButton_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: SizedBox(
                                                          height: 200.0,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child:
                                                              const WprowadznieIlosciWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              if (functions.checkIfNot0(
                                                  FFAppState().quantity)) {
                                                logFirebaseEvent(
                                                    'ScanerIconButton_backend_call');
                                                _model.apiResultgy5 =
                                                    await BarcodereadGroup
                                                        .barcodegetCall
                                                        .call(
                                                  barcode: FFAppState()
                                                      .barcodeValue
                                                      .toString(),
                                                );
                                                logFirebaseEvent(
                                                    'ScanerIconButton_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text((MealStruct.maybeFromMap(functions
                                                                    .transformMealData(
                                                                        (_model.apiResultgy5?.jsonBody ??
                                                                            ''),
                                                                        FFAppState()
                                                                            .quantity)
                                                                    .toMap())!
                                                                .toMap())
                                                            .toString()),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'ScanerIconButton_custom_action');
                                                _model.mealDocRef = await actions
                                                    .saveMealsDataIfNotExists(
                                                  currentUserReference!,
                                                  _model
                                                      .dataBarModel.datestate!,
                                                );
                                                logFirebaseEvent(
                                                    'ScanerIconButton_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            BarcodereadGroup
                                                                .barcodegetCall
                                                                .energy100g(
                                                                  (_model.apiResultgy5
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!
                                                                .toString()),
                                                        content: Text(
                                                            valueOrDefault<
                                                                String>(
                                                          BarcodereadGroup
                                                              .barcodegetCall
                                                              .name(
                                                            (_model.apiResultgy5
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          'uknown',
                                                        )),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'ScanerIconButton_custom_action');
                                                await actions
                                                    .saveMealToFirestore(
                                                  _model.mealDocRef!,
                                                  functions.transformMealData(
                                                      (_model.apiResultgy5
                                                              ?.jsonBody ??
                                                          ''),
                                                      FFAppState().quantity),
                                                );
                                                logFirebaseEvent(
                                                    'ScanerIconButton_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text((_model
                                                                    .apiResultgy5
                                                                    ?.statusCode ??
                                                                200)
                                                            .toString()),
                                                        content: Text((_model
                                                                    .apiResultgy5
                                                                    ?.succeeded ??
                                                                true)
                                                            .toString()),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'ScanerIconButton_backend_call');

                                                await NutrientRecord.createDoc(
                                                        _model.mealDocRef!)
                                                    .set(
                                                        createNutrientRecordData(
                                                  protein:
                                                      valueOrDefault<double>(
                                                    BarcodereadGroup
                                                        .barcodegetCall
                                                        .proteins100g(
                                                      (_model.apiResultgy5
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    0.0,
                                                  ),
                                                  carbohydrates:
                                                      valueOrDefault<double>(
                                                    BarcodereadGroup
                                                        .barcodegetCall
                                                        .carbohydrates100g(
                                                      (_model.apiResultgy5
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    0.0,
                                                  ),
                                                  fiber: valueOrDefault<double>(
                                                    BarcodereadGroup
                                                        .barcodegetCall
                                                        .fiber(
                                                          (_model.apiResultgy5
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ?.first,
                                                    0.0,
                                                  ),
                                                  fats: valueOrDefault<double>(
                                                    BarcodereadGroup
                                                        .barcodegetCall
                                                        .fat100g(
                                                      (_model.apiResultgy5
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    0.0,
                                                  ),
                                                  sugars:
                                                      valueOrDefault<double>(
                                                    BarcodereadGroup
                                                        .barcodegetCall
                                                        .sugars100g(
                                                      (_model.apiResultgy5
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    0.0,
                                                  ),
                                                  salt: valueOrDefault<double>(
                                                    BarcodereadGroup
                                                        .barcodegetCall
                                                        .salt1000g(
                                                      (_model.apiResultgy5
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    0.0,
                                                  ),
                                                  calories:
                                                      valueOrDefault<double>(
                                                    BarcodereadGroup
                                                        .barcodegetCall
                                                        .energy100g(
                                                      (_model.apiResultgy5
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    0.0,
                                                  ),
                                                  water: BarcodereadGroup
                                                      .barcodegetCall
                                                      .water(
                                                    (_model.apiResultgy5
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  name: BarcodereadGroup
                                                      .barcodegetCall
                                                      .name(
                                                    (_model.apiResultgy5
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                ));
                                                logFirebaseEvent(
                                                    'ScanerIconButton_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: const Text('ss'),
                                                        content: const Text('ssss'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'ScanerIconButton_custom_action');
                                                await actions
                                                    .updateDailyIntakeStates(
                                                  _model
                                                      .dataBarModel.datestate!,
                                                  currentUserReference!,
                                                );
                                                logFirebaseEvent(
                                                    'ScanerIconButton_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: const Text('finish'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'ScanerIconButton_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text('Błąd'),
                                                      content: const Text(
                                                          'Kod nie pasuje do obsługiwanego schematu'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          }

                                          setState(() {});
                                        },
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'iconButtonOnActionTriggerAnimation1']!,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: FaIcon(
                                            FontAwesomeIcons.trash,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'MENU_PAGE_CanContainer_ON_TAP');
                                            logFirebaseEvent(
                                                'CanContainer_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: const TrashCanWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            logFirebaseEvent(
                                                'CanContainer_custom_action');
                                            await actions
                                                .updateDailyIntakeStates(
                                              _model.dataBarModel.datestate!,
                                              currentUserReference!,
                                            );
                                          },
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconButtonOnActionTriggerAnimation2']!,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 20.0, 0.0),
                                      child: Text(
                                        'Menu',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      buttonSize: 45.0,
                                      icon: Icon(
                                        Icons.menu,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 22.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'MENU_PAGE_MenuIconButton_ON_TAP');
                                        logFirebaseEvent(
                                            'MenuIconButton_drawer');
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: wrapWithModel(
                                model: _model.dataBarModel,
                                updateCallback: () => setState(() {}),
                                child: const DataBarWidget(
                                  dataSelected: false,
                                ),
                              ),
                            ),
                          ].addToStart(const SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                    Flexible(
                      child: wrapWithModel(
                        model: _model.dailyActivityTrackerNutritionModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: const DailyActivityTrackerNutritionWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
