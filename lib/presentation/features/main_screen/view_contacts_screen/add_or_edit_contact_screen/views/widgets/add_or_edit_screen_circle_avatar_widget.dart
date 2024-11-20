import 'dart:io';
import 'package:flutter/material.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/controllers/add_or_edit_contact_screen_controller.dart';
import 'package:houzeo_app/presentation/widgets/pick_image_dialogue_widget.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddOrEditProfileScreenCircleAvatarWidget extends StatelessWidget {
  final AddOrEditContactScreenController controller;
  final ContactModel? contact;
  const AddOrEditProfileScreenCircleAvatarWidget(
      {super.key, required this.controller, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddOrEditContactScreenController>(
        builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          SelectImageSourceDialogue().selectImageSourceDialogue(
              context: context,
              onCameraSelected: () => controller.selectUserProfilePhoto(
                  context, ImageSource.camera),
              onGallerySelected: () => controller.selectUserProfilePhoto(
                  context, ImageSource.gallery));
        },
        child: CircleAvatar(
            radius: 33.sp,
            backgroundColor: contact == null
                ? primaryColor.withOpacity(0.1)
                : contact!.avatarColor!.withOpacity(0.8),
            backgroundImage: value.tempProfileImagePath != null
                ? FileImage(File(value.tempProfileImagePath!))
                : null,
            child: value.tempProfileImagePath == null
                ? contact != null
                    ? Text(contact!.firstName[0].toUpperCase(),
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: backgroundColor,
                            fontWeight: FontWeight.w400))
                    : Icon(Icons.add_photo_alternate_outlined,
                        color: primaryColor, size: 28.sp)
                : null),
      );
    });
  }
}
