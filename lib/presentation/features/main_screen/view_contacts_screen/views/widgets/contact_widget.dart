import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/dial_pad_screen/views/controller/dial_pad_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/views/widgets/favorite_contact_widget.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_names.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel contact;
  const ContactWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurStyle: BlurStyle.outer,
                blurRadius: 2,
                color: blackColor.withOpacity(0.12))
          ]),
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(vertical: 5, horizontal: Adaptive.w(3.5)),
        onTap: () {
          context.pushNamed(HouzeoRouteNames.contactProfileScreen,
              pathParameters: {'id': contact.id.toString()});
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        leading: CircleAvatar(
          radius: 19.5.sp,
          backgroundColor:
              contact.profilePic == null ? Colors.red : Colors.transparent,
          backgroundImage: contact.profilePic != null
              ? MemoryImage(contact.profilePic!)
              : null,
          child: contact.profilePic == null
              ? Text(contact.firstName[0].toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: backgroundColor,
                      fontWeight: FontWeight.w400))
              : const SizedBox(),
        ),
        title: Text('${contact.firstName} ${contact.lastName}',
            style: TextStyle(fontSize: 17.5.sp)),
        subtitle: Text(contact.phoneNumber,
            style: TextStyle(fontSize: 15.sp, color: subTextColor)),
        trailing: FavoriteWidgetIconButton(
            icon: Icons.phone,
            onPressed: () {
              Provider.of<DialPadScreenController>(context, listen: false)
                  .makeCall(context, contact.phoneNumber);
            },
            color: Colors.green),
      ),
    );
  }
}
