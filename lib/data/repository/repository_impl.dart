import 'package:dartz/dartz.dart';
import 'package:tutapp/data/mapper/mapper.dart';
import 'package:tutapp/data/network/network_info.dart';

import '../../domain/model/models.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/failure.dart';
import '../network/requests.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      var respons = await _remoteDataSource.login(loginRequest);
      if(respons.status==0){
           return right( respons.toDomain());
      }
      else{

           return left( Failure(409,respons.message??" business error message"));

      }
      
    } else {
                 return left( Failure(501,"please check your internet connection"));

    }
  }
}
