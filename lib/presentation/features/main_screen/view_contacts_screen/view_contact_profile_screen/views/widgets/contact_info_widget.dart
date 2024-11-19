import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:houzeo_app/utils/constants/paddings.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactInfoWidget extends StatelessWidget {
  final String contactNumber;
  const ContactInfoWidget({super.key, required this.contactNumber});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          sizedBoxHeight30,
          Padding(
            padding: defaultPadding,
            child: Container(
              width: Adaptive.w(100),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: cardColor,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 3,
                        color: blackColor.withOpacity(0.15))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact info',
                      style: TextStyle(
                          fontSize: 16.3.sp, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.phone_outlined, size: 25),
                    title: Text(
                      contactNumber,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.2.sp),
                    ),
                    subtitle: const Text(
                      'Phone',
                      style: TextStyle(color: subTextColor),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message_outlined, size: 25)),
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
