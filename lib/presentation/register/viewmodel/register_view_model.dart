import 'dart:async';
import 'dart:io';

import '../../common/state_renderer.dart/state_renderer.dart';
import '../../common/state_renderer.dart/state_renderer_impl.dart';
import '/domain/usecase/register_usecase.dart';
import '/presentation/base/baseviewmodel.dart';
import '/presentation/resources/strings_manager.dart';

import '../../../app/functions.dart';
import '../../common/freezed_data_classes.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutput {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController mobileNumberStreamController =
      StreamController<String>.broadcast();
  StreamController emailStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();
  StreamController profilePictureStreamController =
      StreamController<File>.broadcast();
  StreamController areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final RegisterUseCase _registerUseCase;
  var registerObject = RegisterObject("", "", "", "", "", "");

  RegisterViewModel(this._registerUseCase);

  // inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    userNameStreamController.close();
    mobileNumberStreamController.close();
    emailStreamController.close();
    passwordStreamController.close();
    profilePictureStreamController.close();
    areAllInputsValidStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputEmail => emailStreamController.sink;

  @override
  Sink get inputMobileNumber => mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => profilePictureStreamController.sink;


  @override

  Sink get inputUserName => userNameStreamController.sink;


  @override
  Sink get inputAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _registerUseCase.execute(RegisterUseCaseInput(
            registerObject.userName,
            registerObject.countryMobileCode,
            registerObject.mobileNumber,
            registerObject.email,
            registerObject.password,
            registerObject.profilePicture)))
        .fold(
            (failure) => {
                  // left -> failure
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      // navigate to main screen
      // isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  @override

  setUserName(String userName) {

    if (_isUserNameValid(userName)) {

      //  update register view object

      registerObject = registerObject.copyWith(userName: userName);

    } else {

      // reset username value in register view object

      registerObject = registerObject.copyWith(userName: "");

    }

  }
  @override

  setCountryCode(String countryCode) {

    if (countryCode.isNotEmpty) {

      //  update register view object

      registerObject = registerObject.copyWith(countryMobileCode: countryCode);

    } else {

      // reset code value in register view object

      registerObject = registerObject.copyWith(countryMobileCode: "");

    }
validate();
  }




  @override

  setEmail(String email) {

    if (isEmailValid(email)) {

      //  update register view object

      registerObject = registerObject.copyWith(email: email);

    } else {

      // reset email value in register view object

      registerObject = registerObject.copyWith(email: "");

    }
validate();
  }




  @override

  setMobileNumber(String mobileNumber) {

    if (_isMobileNumberValid(mobileNumber)) {

      //  update register view object

      registerObject = registerObject.copyWith(mobileNumber: mobileNumber);

    } else {

      // reset mobileNumber value in register view object

      registerObject = registerObject.copyWith(mobileNumber: "");

    }
validate();
  }




  @override

  setPassword(String password) {

    if (_isPasswordValid(password)) {

      //  update register view object

      registerObject = registerObject.copyWith(password: password);

    } else {

      // reset password value in register view object

      registerObject = registerObject.copyWith(password: "");

    }
validate();
  }




  @override

  setProfilePicture(File profilePicture) {

    if (profilePicture.path.isNotEmpty) {

      //  update register view object

      registerObject =

          registerObject.copyWith(profilePicture: profilePicture.path);

    } else {

      // reset profilePicture value in register view object

      registerObject = registerObject.copyWith(profilePicture: "");

    }
validate();
  }




  // -- outputs


  @override
  Stream<bool> get outputAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outputIsUserNameValid => userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid
      .map((isUserName) => isUserName ? null : AppStrings.userNameInvalid);

  @override
  Stream<bool> get outputIsEmailValid =>
      emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<String?> get outputErrorEmail => outputIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : AppStrings.invalidEmail);

  @override
  Stream<bool> get outputIsMobileNumberValid =>
      mobileNumberStreamController.stream
          .map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<String?> get outputErrorMobileNumber =>
      outputIsMobileNumberValid.map((isMobileNumberValid) =>
          isMobileNumberValid ? null : AppStrings.mobileNumberInvalid);

  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword => outputIsPasswordValid.map(
      (isPasswordValid) => isPasswordValid ? null : AppStrings.passwordInvalid);

  @override
  Stream<File> get outputIsProfilePictureValid =>
      profilePictureStreamController.stream.map((file) => file);

  // --  private functions

  bool _isUserNameValid(String userName) {
    return userName.length >= 8;
  }

  bool _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length >= 10;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }


  bool _areAllInputsValid() {
    return registerObject.countryMobileCode.isNotEmpty &&
        registerObject.mobileNumber.isNotEmpty &&
        registerObject.userName.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.profilePicture.isNotEmpty;
  }

  validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class RegisterViewModelInput {
  Sink get inputUserName;

  Sink get inputMobileNumber;

  Sink get inputEmail;


  Sink get inputPassword;




  Sink get inputProfilePicture;




  register();




  setUserName(String userName);




  setMobileNumber(String mobileNumber);




  setCountryCode(String countryCode);




  setEmail(String email);




  setPassword(String password);




  setProfilePicture(File profilePicture);
  Sink get inputAllInputsValid;
}




abstract class RegisterViewModelOutput {
  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsMobileNumberValid;

  Stream<String?> get outputErrorMobileNumber;

  Stream<bool> get outputIsEmailValid;

  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<File> get outputIsProfilePictureValid;
    Stream<bool> get outputAreAllInputsValid;
}