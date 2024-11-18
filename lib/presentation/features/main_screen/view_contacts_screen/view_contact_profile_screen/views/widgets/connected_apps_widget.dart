import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:houzeo_app/utils/constants/paddings.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConnectedAppsWidget extends StatelessWidget {
  const ConnectedAppsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          sizedBoxHeight20,
          Padding(
            padding: defaultPadding,
            child: Container(
              width: Adaptive.w(100),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: lighThemeSecondaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Connected apps',
                      style: TextStyle(
                          fontSize: 16.3.sp, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.facebook, size: 25),
                    title: Text(
                      'Facebook',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.2.sp),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.expand_more_outlined, size: 25)),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.email_outlined, size: 25),
                    title: Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.2.sp),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.expand_more_outlined, size: 25)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
