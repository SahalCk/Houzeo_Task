import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:houzeo_app/presentation/features/main_screen/controllers/main_screen_controller.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:houzeo_app/utils/constants/paddings.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoFavoriteContactsFoundWidget extends StatelessWidget {
  const NoFavoriteContactsFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: extraPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/favorite_contact_not_found.svg',
                width: Adaptive.w(70)),
            sizedBoxHeight25,
            Text("No favorite contact found",
                style: TextStyle(fontSize: 15.5.sp)),
            sizedBoxHeight10,
            const AddFavContactButtonWidget()
          ],
        ),
      ),
    );
  }
}

class AddFavContactButtonWidget extends StatelessWidget {
  const AddFavContactButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            Provider.of<MainScreenController>(context, listen: false)
                .changeCurrentScreenIndex(1),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: const Text('Add Favorite Contacts',
            style: TextStyle(color: whiteColor)));
  }
}
