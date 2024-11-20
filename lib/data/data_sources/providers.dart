import 'package:flutter/material.dart';
import 'package:houzeo_app/presentation/features/main_screen/controllers/main_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/dial_pad_screen/views/controller/dial_pad_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/search_contact_screen/controllers/search_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/controllers/view_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/controllers/add_or_edit_contact_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/controllers/view_contact_profile_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/controllers/view_favorite_contacts_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HouzeoProviders {
  List<SingleChildWidget> getAllProviders(BuildContext context) {
    return [
      ChangeNotifierProvider(create: (context) => MainScreenController()),
      ChangeNotifierProvider(
          create: (context) => ViewFavoriteContactsScreenController()),
      ChangeNotifierProvider(
          create: (context) => ViewContactsScreenController()),
      ChangeNotifierProvider(
          create: (context) => AddOrEditContactScreenController()),
      ChangeNotifierProvider(create: (context) => SearchScreenController()),
      ChangeNotifierProvider(create: (context) => DialPadScreenController()),
      ChangeNotifierProvider(
          create: (context) => ViewContactProfileScreenController())
    ];
  }
}
