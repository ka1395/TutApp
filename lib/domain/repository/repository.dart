import 'package:dartz/dartz.dart';
import 'package:tutapp/data/network/requests.dart';
import 'package:tutapp/domain/model/models.dart';

import '../../data/network/failure.dart';

abstract class Repository {
Future<Either<Failure,Authentication>>  login(LoginRequest loginRequest);
}
