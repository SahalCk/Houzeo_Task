import 'package:flutter/material.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/profile_screen_option_widget.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactProfileScreenButtonsHeadser extends StatelessWidget {
  final String contactNumber;
  const ContactProfileScreenButtonsHeadser({
    super.key,
    required this.contactNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: CustomHeaderDelegate(
          child: Container(
            color: backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  left: Adaptive.w(5), right: Adaptive.w(5), top: 10),
              child: const Flex(
                direction: Axis.horizontal,
                children: [
                  ProfileScreenOptionWidget(
                      title: 'Call', icon: Icons.phone_outlined),
                  ProfileScreenOptionWidget(
                      title: 'Text', icon: Icons.message_outlined),
                  ProfileScreenOptionWidget(
                      title: 'Set up', icon: Icons.videocam_outlined),
                ],
              ),
            ),
          ),
        ));
  }
}

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  CustomHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 100; // Height of the widget
  @override
  double get minExtent => 100; // Minimum height when pinned
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
