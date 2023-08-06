// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginOpject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginOpjectCopyWith<LoginOpject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginOpjectCopyWith<$Res> {
  factory $LoginOpjectCopyWith(
          LoginOpject value, $Res Function(LoginOpject) then) =
      _$LoginOpjectCopyWithImpl<$Res, LoginOpject>;
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginOpjectCopyWithImpl<$Res, $Val extends LoginOpject>
    implements $LoginOpjectCopyWith<$Res> {
  _$LoginOpjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginOpjectCopyWith<$Res>
    implements $LoginOpjectCopyWith<$Res> {
  factory _$$_LoginOpjectCopyWith(
          _$_LoginOpject value, $Res Function(_$_LoginOpject) then) =
      __$$_LoginOpjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class __$$_LoginOpjectCopyWithImpl<$Res>
    extends _$LoginOpjectCopyWithImpl<$Res, _$_LoginOpject>
    implements _$$_LoginOpjectCopyWith<$Res> {
  __$$_LoginOpjectCopyWithImpl(
      _$_LoginOpject _value, $Res Function(_$_LoginOpject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$_LoginOpject(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginOpject implements _LoginOpject {
  _$_LoginOpject(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginOpject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginOpject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginOpjectCopyWith<_$_LoginOpject> get copyWith =>
      __$$_LoginOpjectCopyWithImpl<_$_LoginOpject>(this, _$identity);
}

abstract class _LoginOpject implements LoginOpject {
  factory _LoginOpject(final String userName, final String password) =
      _$_LoginOpject;

  @override
  String get userName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginOpjectCopyWith<_$_LoginOpject> get copyWith =>
      throw _privateConstructorUsedError;
}
