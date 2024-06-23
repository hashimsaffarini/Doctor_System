import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:doctor_system/features/home/logic/home_cubit.dart';
import 'package:doctor_system/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.specializationsList});
  final List<SpecializationsData?> specializationsList;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setUpCilck(index, context);
            },
            child: SpecialityListViewItem(
              specializationsData: widget.specializationsList[index],
              index: index,
              selectedIndex: selectedIndex,
            ),
          );
        },
      ),
    );
  }

  void setUpCilck(int index, BuildContext context) {
    setState(() {
      selectedIndex = index;
    });
    context.read<HomeCubit>().getDoctorsList(
          specializationId: widget.specializationsList[selectedIndex]?.id,
        );
  }
}
