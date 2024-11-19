// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:houzeo_app/data/data_sources/local_data_source.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/controllers/view_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/widgets/snack_bar_widgets.dart';
import 'package:provider/provider.dart';

class ViewFavoriteContactsScreenController with ChangeNotifier {
  bool isAleradyFetched = false;
  List<ContactModel> favoriteContacts = [];

  Future<List<ContactModel>> getAllFavoriteContacts(
      BuildContext context) async {
    try {
      favoriteContacts.clear();
      final contactsController =
          Provider.of<ViewContactsScreenController>(context, listen: false);
      if (!contactsController.isAlreadyFetched) {
        await contactsController.getAllContacts(context);
      }
      for (var contact in contactsController.allContacts) {
        if (contact.isFavorite) {
          favoriteContacts.add(contact);
        }
      }
      isAleradyFetched = true;
    } catch (e) {
      errorSnackBar(context, e.toString());
    }
    return favoriteContacts;
  }

  Future<bool> addOrRemoveToFavorite(
      BuildContext context, ContactModel contact, bool isAdd) async {
    try {
      await HouzeoLocalDBFunctions()
          .addOrRemoveToFavorite(context, contact.id!, isAdd);
      final contactScreenController =
          Provider.of<ViewContactsScreenController>(context, listen: false);
      final index = contactScreenController.allContacts
          .indexWhere((element) => element.id == contact.id);
      contactScreenController.allContacts[index].isFavorite =
          isAdd ? true : false;
      final groupedIndex = contactScreenController
          .groupedContacts[contact.firstName[0].toUpperCase()]!
          .indexWhere((element) => element.id == contact.id);
      contactScreenController
          .groupedContacts[contact.firstName[0].toUpperCase()]![groupedIndex]
          .isFavorite = isAdd ? true : false;
      contactScreenController.refreshScreen();
      if (isAdd) {
        successSnackBar(context, "Contact added to favorites successfully");
        favoriteContacts.add(contact);
      } else {
        errorSnackBar(context, "Contact removed from favorites successfully");
        favoriteContacts.remove(contact);
      }
      refreshScreen();
      return true;
    } catch (e) {
      errorSnackBar(context, e.toString());
      return false;
    }
  }

  void refreshScreen() {
    isAleradyFetched = false;
    notifyListeners();
  }
}
