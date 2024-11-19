import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        width: Adaptive.w(100),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 1,
                  color: blackColor.withOpacity(0.1))
            ]),
        child: const Flex(
          direction: Axis.horizontal,
          children: [
            Icon(Icons.search),
            SizedBox(width: 12),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search Contact', border: InputBorder.none),
            ))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
