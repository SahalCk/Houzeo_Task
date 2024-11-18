import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_names.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(vertical: 2, horizontal: Adaptive.w(3.5)),
      onTap: () {
        context.pushNamed(HouzeoRouteNames.contactProfileScreen);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 19.5.sp,
        child: Text(
          'R',
          style: TextStyle(
              fontSize: 20.2.sp,
              color: lightThemeBackgroundColor,
              fontWeight: FontWeight.w400),
        ),
      ),
      title: Text(
        'Rameez',
        style: TextStyle(fontSize: 17.5.sp),
      ),
    );
  }
}
