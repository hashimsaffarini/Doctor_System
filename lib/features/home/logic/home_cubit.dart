import 'package:doctor_system/core/helper/extinstions.dart';
import 'package:doctor_system/core/networking/api_error_handler.dart';
import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:doctor_system/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specializationsList = [];

  Future<void> getSpecialization() async {
    emit(const HomeState.specilizationLoading());
    final response = await _homeRepo.getSpcialization();
    response.when(
      success: (data) {
        specializationsList = data.specializationDataList ?? [];
        // get the doctors list for the first specialization by default
        getDoctorsList(specializationId: specializationsList?.first?.id);

        emit(HomeState.specilizationSucess(specializationsList));
      },
      failure: (message) {
        emit(HomeState.specilizationError(message));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
