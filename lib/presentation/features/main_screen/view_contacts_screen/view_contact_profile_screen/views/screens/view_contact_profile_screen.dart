import 'package:flutter/material.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/connected_apps_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/contact_info_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/contact_settings_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/profile_name_and_image_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/profile_screen_option_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/view_profile_screen_appbar.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewContactProfileScreen extends StatelessWidget {
  const ViewContactProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ViewProfileScreenAppBarWidget(),
          const ProfileNameAndImageWidget(),
          SliverPersistentHeader(
              pinned: true,
              delegate: CustomHeaderDelegate(
                child: Container(
                  color: lightThemeBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
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
              )),
          const ContactInfoWidget(),
          const ConnectedAppsWidget(),
          const ContactSettingsWidget()
        ],
      ),
    );
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
  double get maxExtent => 90; // Height of the widget
  @override
  double get minExtent => 90; // Minimum height when pinned
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
