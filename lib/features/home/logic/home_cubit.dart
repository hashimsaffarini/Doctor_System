import 'package:doctor_system/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  Future<void> getSpecialization() async {
    emit(const HomeState.specilizationLoading());
    final response = await _homeRepo.getSpcialization();
    response.when(
      success: (data) {
        emit(HomeState.specilizationSucess(data));
      },
      failure: (message) {
        emit(HomeState.specilizationError(message));
      },
    );
  }
}
