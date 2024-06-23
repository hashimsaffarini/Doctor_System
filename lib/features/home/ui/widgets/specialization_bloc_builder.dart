import 'package:doctor_system/core/helper/spacing.dart';
import 'package:doctor_system/features/home/logic/home_cubit.dart';
import 'package:doctor_system/features/home/logic/home_state.dart';
import 'package:doctor_system/features/home/ui/widgets/doctor_shimmer_loading.dart';
import 'package:doctor_system/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:doctor_system/features/home/ui/widgets/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({
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
              var specializationsList = data;

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

  Widget setuptSucess(specializationsList) {
    return DoctorSpecialityListView(
      specializationsList: specializationsList ?? [],
    );
  }

  Widget seupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8.0),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }
}
