import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dark_and_light_mode_model.dart';
export 'dark_and_light_mode_model.dart';

class DarkAndLightModeWidget extends StatefulWidget {
  const DarkAndLightModeWidget({super.key});

  @override
  State<DarkAndLightModeWidget> createState() => _DarkAndLightModeWidgetState();
}

class _DarkAndLightModeWidgetState extends State<DarkAndLightModeWidget>
    with TickerProviderStateMixin {
  late DarkAndLightModeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DarkAndLightModeModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
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
    return Container(
      width: 100.0,
      height: 70.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'DARK_AND_LIGHT_MODE_LighModeIcon_ON_TAP');
                      logFirebaseEvent('LighModeIcon_set_dark_mode_settings');
                      setDarkModeSetting(context, ThemeMode.light);
                      logFirebaseEvent('LighModeIcon_update_app_state');
                      FFAppState().isDarkMode = !FFAppState().isDarkMode;
                      setState(() {});
                      logFirebaseEvent('LighModeIcon_widget_animation');
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation2']!
                            .controller
                            .reverse();
                      }
                      logFirebaseEvent('LighModeIcon_widget_animation');
                      if (animationsMap['containerOnActionTriggerAnimation1'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation1']!
                            .controller
                            .forward(from: 0.0);
                      }
                    },
                    child: Icon(
                      Icons.wb_sunny_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                  Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation1']!,
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'DARK_AND_LIGHT_MODE_DarkModeIcon_ON_TAP');
                      logFirebaseEvent('DarkModeIcon_set_dark_mode_settings');
                      setDarkModeSetting(context, ThemeMode.dark);
                      logFirebaseEvent('DarkModeIcon_update_app_state');
                      FFAppState().isDarkMode = !FFAppState().isDarkMode;
                      setState(() {});
                      logFirebaseEvent('DarkModeIcon_widget_animation');
                      if (animationsMap['containerOnActionTriggerAnimation1'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation1']!
                            .controller
                            .reverse();
                      }
                      logFirebaseEvent('DarkModeIcon_widget_animation');
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation2']!
                            .controller
                            .forward(from: 0.0);
                      }
                    },
                    child: Icon(
                      Icons.mode_night_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                  Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation2']!,
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
            ],
          ),
        ].addToStart(const SizedBox(height: 7.0)).addToEnd(const SizedBox(height: 7.0)),
      ),
    );
  }
}
