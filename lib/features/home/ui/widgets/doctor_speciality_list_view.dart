import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:doctor_system/features/home/logic/home_cubit.dart';
import 'package:doctor_system/features/home/ui/widgets/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatefulWidget {
  const DoctorSpecialityListView(
      {super.key, required this.specializationsList});
  final List<SpecializationsData?> specializationsList;

  @override
  State<DoctorSpecialityListView> createState() =>
      _DoctorSpecialityListViewState();
}

class _DoctorSpecialityListViewState extends State<DoctorSpecialityListView> {
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
              setState(() {
                selectedIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                    specializationId:
                        widget.specializationsList[selectedIndex]?.id,
                  );
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
}
