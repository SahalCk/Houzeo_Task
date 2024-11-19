import 'dart:io';
import 'package:flutter/material.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/controllers/add_or_edit_contact_screen_controller.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddOrEditProfileScreenCircleAvatarWidget extends StatelessWidget {
  const AddOrEditProfileScreenCircleAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddOrEditContactScreenController>(
        builder: (context, value, child) {
      return CircleAvatar(
          radius: 33.sp,
          backgroundColor: Colors.red,
          backgroundImage: value.tempProfileImagePath != null
              ? FileImage(File(value.tempProfileImagePath!))
              : null,
          child: value.tempProfileImagePath == null
              ? Text('R',
                  style: TextStyle(
                      fontSize: 35.sp,
                      color: backgroundColor,
                      fontWeight: FontWeight.w400))
              : null);
    });
  }
}
