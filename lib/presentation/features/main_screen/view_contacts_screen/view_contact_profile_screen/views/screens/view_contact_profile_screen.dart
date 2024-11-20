import 'package:flutter/material.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/controllers/view_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/connected_apps_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/contact_info_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/contact_options_screen_buttons_header.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/contact_settings_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/profile_name_and_image_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/widgets/view_profile_screen_appbar.dart';
import 'package:provider/provider.dart';

class ViewContactProfileScreen extends StatefulWidget {
  final int id;
  const ViewContactProfileScreen({super.key, required this.id});

  @override
  State<ViewContactProfileScreen> createState() =>
      _ViewContactProfileScreenState();
}

class _ViewContactProfileScreenState extends State<ViewContactProfileScreen> {
  ContactModel? contact;

  @override
  void initState() {
    final allContacts =
        Provider.of<ViewContactsScreenController>(context, listen: false)
            .allContacts;
    contact = allContacts.firstWhere((element) => element.id == widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ViewProfileScreenAppBarWidget(contact: contact!),
          ProfileNameAndImageWidget(contactModel: contact!),
          ContactProfileScreenButtonsHeader(
              contactNumber: contact!.phoneNumber),
          ContactInfoWidget(contactNumber: contact!.phoneNumber),
          const ConnectedAppsWidget(),
          ContactSettingsWidget(contact: contact!)
        ],
      ),
    );
  }
}
