import 'dart:async';

import '/presentation/base/base_view_model.dart';

import '../../common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController passwordStreamController =
      StreamController<String>.broadcast();
  var loginOpject = LoginOpject("", "");
  // inputs
  @override
  void dispose() {
    userNameStreamController.close();
    passwordStreamController.close();
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
  setPassword(String password) {
    inputPassword.add(password);
    loginOpject = loginOpject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
        loginOpject = loginOpject.copyWith(userName: userName);
  }

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
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
}

abstract class LoginViewModelInputs {
  setUserName(String userName);

  setPassword(String password);

  login();

  Sink get inputUserName;

  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;
}
