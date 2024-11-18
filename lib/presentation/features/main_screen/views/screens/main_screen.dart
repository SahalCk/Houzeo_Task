import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contacts_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/view_favorite_contacts_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/views/controllers/main_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/views/widgets/bottom_navigation_bar_widget.dart';
import 'package:houzeo_app/presentation/theme/houzeo_theme.dart';
import 'package:houzeo_app/presentation/theme/theme_mode_controller.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeModeController>(context).themeData ==
        HouzeoAppTheme.darkTheme;

    const screens = [ViewFavoriteContactsScreen(), ViewContactsScreen()];

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarBrightness:
                isDarkTheme ? Brightness.dark : Brightness.light,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarColor:
                isDarkTheme ? darkThemeSecondaryColor : lighThemeSecondaryColor,
            systemNavigationBarIconBrightness:
                isDarkTheme ? Brightness.light : Brightness.dark),
        child: Scaffold(
          body:
              Consumer<MainScreenController>(builder: (context, value, child) {
            return SafeArea(child: screens[value.currentScreenIndex]);
          }),
          bottomNavigationBar: const HouzeoBottomNavigationBarWidget(),
          floatingActionButton: FloatingActionButton(
              onPressed: () {}, child: const Icon(Icons.dialpad)),
        ));
  }
}
