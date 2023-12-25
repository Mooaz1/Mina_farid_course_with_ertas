import 'package:dartz/dartz.dart';
import 'package:mf_course/data/data_services/data_services.dart';
import 'package:mf_course/data/failure/failure.dart';
import 'package:mf_course/data/mappers/mappers.dart';
import 'package:mf_course/data/network/error_handler.dart';
import 'package:mf_course/data/network/network_info.dart';
import 'package:mf_course/data/requests/requests_model.dart';
import 'package:mf_course/domain/repository/repository.dart';
import 'package:mf_course/domain/view_models/models.dart';

class RepositoryImpl implements BaseRepository {
  final BaseDataSerivces _baseDataSerivces;
  final BaseNetworkInfo _baseNetworkInfo;

  RepositoryImpl(this._baseDataSerivces, this._baseNetworkInfo);
  @override
  Future<Either<Failure, BaseLogin>> login(
      LoginRequest loginRequest) async {
    if (await _baseNetworkInfo.checkConnection()) {
     try {
        final resonse = await _baseDataSerivces.login(loginRequest);
      if (resonse.status == ApiInternalStatus.SUCCESS) {
        return Right(resonse.toDomain());
      } else {
        return Left(Failure( ApiInternalStatus.LoginFailure,resonse.message?? ResponseMessage.DEFAULT));
      }
     } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
       
     }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.failure());
    }
  }
}
