import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/controllers/add_or_edit_contact_screen_controller.dart';
import 'package:houzeo_app/presentation/widgets/pick_image_dialogue_widget.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhotoChangeAndRemoveButton extends StatelessWidget {
  final AddOrEditContactScreenController controller;
  final bool isAdd;
  final Uint8List? image;
  const PhotoChangeAndRemoveButton(
      {super.key,
      required this.controller,
      required this.isAdd,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              SelectImageSourceDialogue().selectImageSourceDialogue(
                  context: context,
                  onCameraSelected: () => controller.selectUserProfilePhoto(
                      context, ImageSource.camera),
                  onGallerySelected: () => controller.selectUserProfilePhoto(
                      context, ImageSource.gallery));
            },
            child: Row(
              children: [
                Icon(
                    isAdd || image == null
                        ? Icons.add_photo_alternate_outlined
                        : Icons.edit_outlined,
                    size: 17.sp,
                    color: primaryColor),
                const SizedBox(width: 6),
                Text(isAdd || image == null ? 'Uplaod Image' : 'Change',
                    style: TextStyle(
                        fontSize: 15.6.sp,
                        color: primaryColor,
                        fontWeight: FontWeight.w500))
              ],
            )),
        Visibility(
          visible: !isAdd && image != null,
          child: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.delete_outline_outlined,
                      size: 17.sp, color: primaryColor),
                  const SizedBox(width: 6),
                  Text('Remove',
                      style: TextStyle(
                          fontSize: 15.6.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.w500))
                ],
              )),
        )
      ],
    );
  }
}
