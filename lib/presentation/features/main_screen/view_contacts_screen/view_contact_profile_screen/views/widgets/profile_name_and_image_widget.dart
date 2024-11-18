import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:houzeo_app/utils/constants/paddings.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileNameAndImageWidget extends StatelessWidget {
  const ProfileNameAndImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: defaultPadding,
        child: Column(
          children: [
            sizedBoxHeight30,
            CircleAvatar(
              radius: 38.sp,
              backgroundColor: Colors.red,
              child: Text(
                'R',
                style: TextStyle(
                    fontSize: 40.sp,
                    color: lightThemeBackgroundColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            sizedBoxHeight25,
            Text(
              'Mohammed Sahal',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 21.sp),
            ),
            sizedBoxHeight30
          ],
        ),
      ),
    );
  }
}
