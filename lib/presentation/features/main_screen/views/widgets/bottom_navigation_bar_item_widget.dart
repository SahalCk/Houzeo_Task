import 'package:flutter/material.dart';
import 'package:houzeo_app/model/entities/main_screen/bottom_navigation_bar_item_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/controllers/main_screen_controller.dart';
import 'package:houzeo_app/presentation/theme/houzeo_theme.dart';
import 'package:houzeo_app/presentation/theme/theme_mode_controller.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavigationBarItemWidget extends StatefulWidget {
  final BottomNavigationBarItemModel item;
  const BottomNavigationBarItemWidget({super.key, required this.item});

  @override
  State<BottomNavigationBarItemWidget> createState() =>
      _BottomNavigationBarItemWidgetState();
}

class _BottomNavigationBarItemWidgetState
    extends State<BottomNavigationBarItemWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation;
  @override
  void initState() {
    _animationController =
        AnimationController(duration: Durations.medium1, vsync: this);
    _backgroundAnimation = Tween(begin: 30.0, end: 75.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeModeController>(context).themeData ==
        HouzeoAppTheme.darkTheme;
    return Expanded(
      flex: 1,
      child: Consumer<MainScreenController>(builder: (context, value, child) {
        if (value.currentScreenIndex == widget.item.screenIndex) {
          _animationController.forward();
        } else {
          if (_animationController.isCompleted) {
            _animationController.reverse();
          }
        }
        return InkWell(
          onTap: () {
            value.changeCurrentScreenIndex(widget.item.screenIndex);
          },
          child: Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            children: [
              SizedBox(
                height: 35.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                        value.currentScreenIndex == widget.item.screenIndex
                            ? widget.item.selectedIcon
                            : widget.item.icon,
                        size: 21.5.sp),
                    Visibility(
                      visible:
                          value.currentScreenIndex == widget.item.screenIndex,
                      child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Container(
                              width: _backgroundAnimation.value,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: isDarkTheme
                                      ? darkThmePrimaryColor.withOpacity(0.2)
                                      : lightThmePrimaryColor.withOpacity(0.2)),
                            );
                          }),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Text(widget.item.title,
                  style: TextStyle(
                      fontSize: 14.5.sp,
                      color: value.currentScreenIndex == widget.item.screenIndex
                          ? isDarkTheme
                              ? darkThemeTextColor
                              : lightThemeTextColor
                          : isDarkTheme
                              ? darkThemeSubTextColor
                              : lightThemeSubTextColor,
                      fontWeight:
                          value.currentScreenIndex == widget.item.screenIndex
                              ? FontWeight.w600
                              : FontWeight.w500))
            ],
          ),
        );
      }),
    );
  }
}
