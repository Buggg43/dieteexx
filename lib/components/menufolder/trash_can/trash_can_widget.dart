import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'trash_can_model.dart';
export 'trash_can_model.dart';

class TrashCanWidget extends StatefulWidget {
  const TrashCanWidget({super.key});

  @override
  State<TrashCanWidget> createState() => _TrashCanWidgetState();
}

class _TrashCanWidgetState extends State<TrashCanWidget> {
  late TrashCanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrashCanModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 400.0,
                child: custom_widgets.MealsSelectionWidget(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 400.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
