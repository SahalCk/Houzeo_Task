import 'package:flutter/material.dart';
import 'package:houzeo_app/model/entities/main_screen/bottom_navigation_bar_item_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/views/widgets/bottom_navigation_bar_item_widget.dart';
import 'package:houzeo_app/presentation/theme/houzeo_theme.dart';
import 'package:houzeo_app/presentation/theme/theme_mode_controller.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HouzeoBottomNavigationBarWidget extends StatelessWidget {
  const HouzeoBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeModeController>(context).themeData ==
        HouzeoAppTheme.darkTheme;
    return Container(
        width: Adaptive.w(100),
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(1.8)),
        decoration: BoxDecoration(
            color: isDarkTheme
                ? darkThemeSecondaryColor
                : lighThemeSecondaryColor),
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
        ));
  }
}
