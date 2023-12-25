import 'package:dartz/dartz.dart';
import 'package:mf_course/data/failure/failure.dart';
import 'package:mf_course/domain/view_models/models.dart';

abstract class BaseUseCase<In,Out>{
  Future<Either<Failure,BaseLogin>> excute(In input);
}