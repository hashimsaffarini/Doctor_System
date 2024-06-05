import 'package:doctor_system/core/networking/api_error_handler.dart';
import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  //specilization
  const factory HomeState.specilizationLoading() = SpecilizationLoading;
  const factory HomeState.specilizationSucess(SpecializationsResponseModel specializationsResponseModel) = SpecilizationSucess ;
  const factory HomeState.specilizationError(ErrorHandler errorHandler) = SpecilizationError;



}
