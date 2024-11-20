import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/views/screens/view_contacts_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/views/screens/view_favorite_contacts_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/controllers/main_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/views/widgets/bottom_navigation_bar_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/views/widgets/search_bar_widget.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const screens = [ViewFavoriteContactsScreen(), ViewContactsScreen()];

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarColor: backgroundColor),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const SearchBarWidget(),
          body:
              Consumer<MainScreenController>(builder: (context, value, child) {
            return SafeArea(child: screens[value.currentScreenIndex]);
          }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const HouzeoBottomNavigationBarWidget(),
        ));
  }
}
