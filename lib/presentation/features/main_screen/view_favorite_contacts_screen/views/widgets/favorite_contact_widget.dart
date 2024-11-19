import 'package:flutter/material.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoriteContactWidget extends StatelessWidget {
  final ContactModel contact;
  const FavoriteContactWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurStyle: BlurStyle.outer,
                blurRadius: 3,
                color: blackColor.withOpacity(0.1))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 27.sp,
                backgroundColor: Colors.red,
                backgroundImage: contact.profilePic != null
                    ? MemoryImage(contact.profilePic!)
                    : null,
                child: contact.profilePic == null
                    ? Text(contact.firstName[0].toUpperCase(),
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: backgroundColor,
                            fontWeight: FontWeight.w400))
                    : null),
            const SizedBox(height: 10),
            Text('${contact.firstName} ${contact.lastName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    height: 0, fontWeight: FontWeight.w500, fontSize: 15.5.sp)),
            const SizedBox(height: 3),
            Text(
              contact.phoneNumber,
              style:
                  TextStyle(color: subTextColor, height: 0, fontSize: 14.5.sp),
            )
          ],
        ),
      ),
    );
  }
}
