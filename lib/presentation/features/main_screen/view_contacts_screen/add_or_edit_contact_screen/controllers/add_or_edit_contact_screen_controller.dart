// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/data/data_sources/local_data_source.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/controllers/view_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/widgets/snack_bar_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AddOrEditContactScreenController with ChangeNotifier {
  String? tempProfileImagePath;
  Uint8List? image;

  Future<void> selectUserProfilePhoto(
      BuildContext context, ImageSource imageSource) async {
    if (imageSource == ImageSource.camera) {
      bool isPermissionGiven = await Permission.camera.isGranted;
      if (isPermissionGiven == false) {
        await Permission.camera.request();
      }
      isPermissionGiven = await Permission.camera.isGranted;
      if (isPermissionGiven == false) {
        await openAppSettings();
        return;
      }
    } else {
      bool isPermissionGiven = await Permission.mediaLibrary.isGranted;
      if (isPermissionGiven == false) {
        await Permission.mediaLibrary.request();
      }
      isPermissionGiven = await Permission.mediaLibrary.isGranted;
      if (isPermissionGiven == false) {
        await openAppSettings();
        return;
      }
    }

    final tempImage = await ImagePicker().pickImage(source: imageSource);
    if (tempImage == null) {
      return;
    }

    final imagePath = tempImage.path;
    tempProfileImagePath = imagePath;
    image = await tempImage.readAsBytes();
    context.pop();
    notifyListeners();
  }

  Future addContact(BuildContext context, String firstName, String lastName,
      String company, String phone, String email) async {
    if (phone.isEmpty) {
      errorSnackBar(context, "Please enter phone number");
      return;
    }
    try {
      final contact = ContactModel(
          profilePic: image,
          firstName: firstName,
          lastName: lastName,
          companyName: company,
          phoneNumber: phone,
          email: email,
          isFavorite: false);
      final id = await HouzeoLocalDBFunctions().addNewContact(context, contact);
      if (id != null) {
        successSnackBar(
            context, "$firstName $lastName added to contact successfully");
        final contactScreenController =
            Provider.of<ViewContactsScreenController>(context, listen: false);
        contactScreenController.refreshScreen();
        context.pop();
      } else {
        errorSnackBar(context, 'Somthing went wrong');
      }
    } catch (e) {
      errorSnackBar(context, e.toString());
    }
  }

  Future updateContact(BuildContext context, ContactModel contact) async {
    if (image != null) {
      contact.profilePic = image;
    }
    try {
      final changedRows =
          await HouzeoLocalDBFunctions().updateContact(context, contact);
      if (changedRows != null && changedRows > 0) {
        final contactScreenController =
            Provider.of<ViewContactsScreenController>(context, listen: false);
        final index = contactScreenController.allContacts
            .indexWhere((element) => element.id == contact.id);
        contactScreenController.allContacts[index] = contact;
        final groupedIndex = contactScreenController
            .groupedContacts[contact.firstName[0].toUpperCase()]!
            .indexWhere((element) => element.id == contact.id);
        contactScreenController.groupedContacts[
            contact.firstName[0].toUpperCase()]![groupedIndex] = contact;
        contactScreenController.refreshScreen();
        context.pop();
        context.pop();
        successSnackBar(context, "Contact updated successfully");
      }
    } catch (e) {
      errorSnackBar(context, e.toString());
    }
  }
}
