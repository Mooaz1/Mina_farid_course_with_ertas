import 'package:mf_course/data/requests/requests_model.dart';
import 'package:mf_course/data/response/response_models.dart';

import '../network/app_api.dart';

abstract class BaseDataSerivces {
  Future<BaseLoginResponse> login(LoginRequest loginRequest);
}

class DataServices implements BaseDataSerivces{
  final AppServiceClint _appServiceClint;

  DataServices(this._appServiceClint);
  @override
  Future<BaseLoginResponse> login(LoginRequest loginRequest)async {
    return await _appServiceClint.login(loginRequest.email, loginRequest.password);
  }

}