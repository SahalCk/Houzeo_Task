import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateNewContactButton extends StatelessWidget {
  const CreateNewContactButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.only(
          left: Adaptive.w(4.5) + 45, bottom: 5, top: 5, right: 10),
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.person_add_alt_outlined,
                    size: 21.sp, color: lightThmePrimaryColor),
                const SizedBox(width: 20),
                Expanded(
                    child: Text('Create new contact',
                        style: TextStyle(
                            color: lightThmePrimaryColor,
                            fontSize: 16.3.sp,
                            fontWeight: FontWeight.w400)))
              ],
            ),
          )),
    ));
  }
}
