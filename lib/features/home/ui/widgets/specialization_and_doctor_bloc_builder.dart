import 'package:doctor_system/core/helper/spacing.dart';
import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:doctor_system/features/home/logic/home_cubit.dart';
import 'package:doctor_system/features/home/logic/home_state.dart';
import 'package:doctor_system/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:doctor_system/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationAndDoctorBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecilizationError ||
          current is SpecilizationSucess ||
          current is SpecilizationLoading,
      builder: (context, state) {
        return state.maybeWhen(
            specilizationLoading: () {
              return seupLoading();
            },
            specilizationSucess: (data) {
              var specializationsList = data.specializationDataList;

              return setuptSucess(specializationsList);
            },
            specilizationError: (error) {
              return setuptError();
            },
            orElse: () => setuptError());
      },
    );
  }

  SizedBox setuptError() => const SizedBox.shrink();

  Expanded setuptSucess(List<SpecializationsData?>? specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(
            specializationsList: specializationsList ?? [],
          ),
          verticalSpace(8.0),
          DoctorsListView(
            doctorsList: specializationsList?[0]?.doctorsList ?? [],
          ),
        ],
      ),
    );
  }

  SizedBox seupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
