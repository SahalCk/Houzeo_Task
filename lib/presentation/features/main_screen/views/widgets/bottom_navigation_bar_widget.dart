import 'package:flutter/material.dart';
import 'package:houzeo_app/model/entities/main_screen/bottom_navigation_bar_item_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/views/widgets/bottom_navigation_bar_item_widget.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HouzeoBottomNavigationBarWidget extends StatelessWidget {
  const HouzeoBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(7)),
      child: Container(
          width: Adaptive.w(100),
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(1)),
          decoration: BoxDecoration(
              color: cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 1),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 8,
                    color: blackColor.withOpacity(0.2))
              ]),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              BottomNavigationBarItemWidget(
                  item: BottomNavigationBarItemModel(
                      screenIndex: 0,
                      title: 'Favorites',
                      icon: Icons.star_border,
                      selectedIcon: Icons.star)),
              BottomNavigationBarItemWidget(
                  item: BottomNavigationBarItemModel(
                      screenIndex: 1,
                      title: 'Contacts',
                      icon: Icons.people_alt_outlined,
                      selectedIcon: Icons.people_alt))
            ],
          )),
    );
  }
}
