import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_system/core/helper/spacing.dart';
import 'package:doctor_system/core/theming/styles.dart';
import 'package:doctor_system/features/home/data/models/specilization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsData;
  const DoctorsListViewItem({super.key, this.doctorsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 110.w,
            height: 120.h,
            imageUrl:
                'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12.0),
          //   child: Image.network(
          //     width: 110.w,
          //     height: 120.h,
          //     'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsData?.name ?? 'Doctor Name',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  '${doctorsData?.degree} | ${doctorsData?.phone}',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Text(
                  doctorsData?.email ?? 'Email Address',
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
