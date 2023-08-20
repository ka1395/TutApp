import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';
@freezed
class LoginOpject with _$LoginOpject {
  factory LoginOpject(String userName ,String password) = _LoginOpject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
      String userName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String profilePicture) = _RegisterObject;
}
