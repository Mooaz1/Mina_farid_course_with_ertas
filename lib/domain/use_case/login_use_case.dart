import 'package:dartz/dartz.dart';
import 'package:mf_course/data/failure/failure.dart';
import 'package:mf_course/data/requests/requests_model.dart';
import 'package:mf_course/domain/repository/repository.dart';
import 'package:mf_course/domain/use_case/base_use_case.dart';
import 'package:mf_course/domain/view_models/models.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,BaseLogin>{
  final BaseRepository _baseRepository;

  LoginUseCase(this._baseRepository);
  @override
  Future<Either<Failure, BaseLogin>> excute( input) async{
    return await _baseRepository.login(LoginRequest(email: input.email, password: input.passwrod));
  }

}
class LoginUseCaseInput{
   String email;
   String passwrod;
   LoginUseCaseInput(this.email,this.passwrod);
}