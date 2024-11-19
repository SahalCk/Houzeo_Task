import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/controllers/view_contact_profile_screen_controller.dart';
import 'package:houzeo_app/presentation/widgets/houzeo_loading_dialogue.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:houzeo_app/utils/constants/paddings.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactSettingsWidget extends StatelessWidget {
  final ContactModel contact;
  const ContactSettingsWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxHeight20,
          const Divider(),
          sizedBoxHeight15,
          Padding(
            padding: defaultPadding,
            child: Text('Contact settings',
                style:
                    TextStyle(fontSize: 16.3.sp, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 14),
          ListView.separated(
              padding: defaultPadding,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ContactSettingsOptionWidget(
                    icon: Icons.settings_outlined,
                    title: 'Contact Setting ${index + 1}',
                    onPressed: () {});
              },
              separatorBuilder: (context, index) => sizedBoxHeight15,
              itemCount: 6),
          sizedBoxHeight15,
          Padding(
            padding: defaultPadding,
            child: ContactSettingsOptionWidget(
                icon: Icons.delete_outline_outlined,
                title: 'Delete Contact',
                color: Colors.red,
                onPressed: () {
                  deleteAccountDialogue(context);
                }),
          ),
          const SizedBox(height: 25),
          const Divider(),
          const SizedBox(height: 15),
          const Center(
            child: Text('Houzeo', style: TextStyle(color: subTextColor)),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  void deleteAccountDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(
            'Are you sure you want to delete this contact?',
            style: TextStyle(fontSize: 16.5.sp),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('No')),
                TextButton(
                    onPressed: () async {
                      context.pop();
                      showLoadingDialogue(context);
                      await Provider.of<ViewContactProfileScreenController>(
                              context,
                              listen: false)
                          .deleteContact(context, contact);
                    },
                    child: const Text('Yes'))
              ],
            )
          ],
        );
      },
    );
  }
}

class ContactSettingsOptionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onPressed;
  final Color? color;
  const ContactSettingsOptionWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 1),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 2,
                    color: blackColor.withOpacity(0.15))
              ]),
          child: ListTile(
              leading: Icon(icon, color: color),
              title: Text(title, style: TextStyle(color: color)))),
    );
  }
}
