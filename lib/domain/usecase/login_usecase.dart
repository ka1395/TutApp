import 'package:tutapp/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tutapp/data/network/requests.dart';
import 'package:tutapp/domain/model/models.dart';
import 'package:tutapp/domain/usecase/base_usecase.dart';

import '../repository/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInpute, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInpute inpute) async {
    return await _repository.login(LoginRequest(inpute.email, inpute.password));
  }
}

class LoginUseCaseInpute {
  String email;
  String password;

  LoginUseCaseInpute(this.email, this.password);
}
