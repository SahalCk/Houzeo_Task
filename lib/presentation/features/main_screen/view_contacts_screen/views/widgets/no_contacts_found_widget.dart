import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_names.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoContactsFoundWidget extends StatelessWidget {
  const NoContactsFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/contact_not_found.svg',
              width: Adaptive.w(70)),
          sizedBoxHeight25,
          Text("Oops!! You haven't added any contact yet!",
              style: TextStyle(fontSize: 15.5.sp)),
          sizedBoxHeight10,
          const AddContactButtonWidget()
        ],
      ),
    );
  }
}

class AddContactButtonWidget extends StatelessWidget {
  const AddContactButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.pushNamed(
            HouzeoRouteNames.addOreditContactScreen,
            pathParameters: {'id': 'null'}),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: const Text('Add Contact', style: TextStyle(color: whiteColor)));
  }
}
