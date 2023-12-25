import 'package:dio/dio.dart';
import 'package:mf_course/app/end_points.dart';
import 'package:mf_course/data/response/response_models.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AppServiceClint{

  factory AppServiceClint(Dio dio,{String baseUrl})= _AppServiceClint;

  @POST('/customers/login')
  Future<BaseLoginResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

}