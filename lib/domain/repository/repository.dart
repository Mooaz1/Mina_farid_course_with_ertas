import 'package:dartz/dartz.dart';
import 'package:mf_course/data/requests/requests_model.dart';
import 'package:mf_course/domain/view_models/models.dart';

import '../../data/failure/failure.dart';

abstract class BaseRepository {
  Future<Either<Failure,BaseLogin>> login(LoginRequest loginRequest);
}