import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:doctor_system/features/home/ui/widgets/doctor_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView(
      {super.key, required this.specializationsList});
  final List<SpecializationsData?> specializationsList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsList.length,
        itemBuilder: (context, index) {
          return DoctorSpecialityListViewItem(
            specializationsData: specializationsList[index],
            index: index,
          );
        },
      ),
    );
  }
}
