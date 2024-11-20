import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_names.dart';
import 'package:houzeo_app/utils/constants/colors.dart';

class DialPadIconButton extends StatelessWidget {
  const DialPadIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(HouzeoRouteNames.dialContactScreen);
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
          width: 63,
          height: 63,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurStyle: BlurStyle.outer,
                blurRadius: 4,
                color: blackColor.withOpacity(0.2))
          ], color: primaryColor, borderRadius: BorderRadius.circular(100)),
          child:
              const Icon(Icons.dialpad_rounded, color: whiteColor, size: 25)),
    );
  }
}
