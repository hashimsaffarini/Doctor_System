import 'package:dio/dio.dart';
import 'package:doctor_system/core/networking/api_constants.dart';
import 'package:doctor_system/features/home/data/apis/home_api_constants.dart';
import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.specilizationEP)
  Future<SpecializationsResponseModel> getHomeData();
}
