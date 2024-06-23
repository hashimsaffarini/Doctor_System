import 'package:doctor_system/core/helper/spacing.dart';
import 'package:doctor_system/core/theming/app_colors.dart';
import 'package:doctor_system/core/theming/styles.dart';
import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({
    super.key,
    required this.specializationsData,
    required this.index,
    required this.selectedIndex,
  });
  final SpecializationsData? specializationsData;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: index == 0 ? 0.0 : 24.w,
      ),
      child: Column(
        children: [
          index == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28.r,
                    backgroundColor: AppColors.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svgs/general_speciality.svg',
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28.r,
                  backgroundColor: AppColors.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          verticalSpace(8.0),
          Text(
            specializationsData?.name ?? 'Specialization',
            style: index == selectedIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
