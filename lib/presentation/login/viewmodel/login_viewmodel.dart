import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../domain/usecase/login_usecase.dart';
import '/presentation/base/base_view_model.dart';

import '../../common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginOpject = LoginOpject("", "");
  final _loginUseCase;
  LoginViewModel(this._loginUseCase);
  // inputs
  @override
  void dispose() {
    userNameStreamController.close();
    passwordStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginOpject = loginOpject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginOpject = loginOpject.copyWith(userName: userName);
        inputAreAllInputsValid.add(null);

  }

  @override
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInpute(loginOpject.userName, loginOpject.password)))
        .fold((failure) {
      debugPrint(failure.message);
    }, (data) {
      debugPrint(data.customer?.name);
    });
  }

  // outputs
  @override
  Stream<bool> get outIsPasswordValid =>
      passwordStreamController.stream.map((userName) => _isUserName(userName));

  @override
  Stream<bool> get outIsUserNameValid => passwordStreamController.stream
      .map((passwrod) => _isPasswordValid(passwrod));

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserName(String userName) {
    return userName.isNotEmpty;
  }

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _areAllInputsValid() {
    return _isPasswordValid(loginOpject.password) &&
        _isUserName(loginOpject.userName);
  }
}

abstract class LoginViewModelInputs {
  setUserName(String userName);

  setPassword(String password);

  login();

  Sink get inputUserName;

  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputsValid;
}
