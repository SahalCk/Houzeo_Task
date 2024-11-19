// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/data/data_sources/local_data_source.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/controllers/view_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/widgets/snack_bar_widgets.dart';
import 'package:provider/provider.dart';

class ViewContactProfileScreenController with ChangeNotifier {
  Future<void> deleteContact(BuildContext context, ContactModel contact) async {
    try {
      await HouzeoLocalDBFunctions().deleteContact(context, contact.id!);
      successSnackBar(context, "Contact deleted successfully");
      final contactScreenController =
          Provider.of<ViewContactsScreenController>(context, listen: false);
      contactScreenController.allContacts.remove(contact);
      contactScreenController
          .groupedContacts[contact.firstName[0].toUpperCase()]!
          .remove(contact);
      contactScreenController.refreshScreen();
      context.pop();
      context.pop();
    } catch (e) {
      context.pop();
      errorSnackBar(context, e.toString());
    }
  }
}
