import 'package:doctor_system/core/networking/api_error_handler.dart';
import 'package:doctor_system/core/networking/api_result.dart';
import 'package:doctor_system/features/home/data/apis/home_api_service.dart';
import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);
  Future<ApiResult<SpecializationsResponseModel>> getSpcialization() async {
    try {
      final response = await _homeApiService.getSpcialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
