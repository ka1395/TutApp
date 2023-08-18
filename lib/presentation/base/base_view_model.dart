import 'dart:async';

import 'package:tutapp/presentation/common/state_renderer.dart/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  final StreamController _inputStreamController =
      StreamController<FlowState>.broadcast();
@override
  Sink get inputState => _inputStreamController.sink;


  @override
  Stream<FlowState> get outputState =>_inputStreamController.stream.map((flowState)=>flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); // start view model job

  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  // will be implemented later
  Stream<FlowState> get outputState;
}
