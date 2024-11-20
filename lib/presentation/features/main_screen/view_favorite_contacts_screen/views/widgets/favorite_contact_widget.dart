// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/dial_pad_screen/views/controller/dial_pad_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/controllers/view_favorite_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/widgets/houzeo_loading_dialogue.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';
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
                backgroundColor: contact.avatarColor!.withOpacity(0.8),
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
            Text(contact.phoneNumber,
                style: TextStyle(
                    color: subTextColor, height: 0, fontSize: 14.5.sp)),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FavoriteWidgetIconButton(
                  icon: Icons.call,
                  onPressed: () {
                    Provider.of<DialPadScreenController>(context, listen: false)
                        .makeCall(context, contact.phoneNumber);
                  },
                  color: Colors.green),
              const SizedBox(width: 10),
              FavoriteWidgetIconButton(
                  icon: Icons.star,
                  color: Colors.orange,
                  onPressed: () async {
                    showLoadingDialogue(context);
                    await Provider.of<ViewFavoriteContactsScreenController>(
                            context,
                            listen: false)
                        .addOrRemoveToFavorite(context, contact, false);
                    context.pop();
                  }),
            ])
          ],
        ),
      ),
    );
  }
}

class FavoriteWidgetIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final Color? color;
  const FavoriteWidgetIconButton(
      {super.key, required this.icon, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: color ?? primaryColor),
      style: IconButton.styleFrom(
          backgroundColor: color != null
              ? color!.withOpacity(0.2)
              : primaryColor.withOpacity(0.2)),
    );
  }
}
