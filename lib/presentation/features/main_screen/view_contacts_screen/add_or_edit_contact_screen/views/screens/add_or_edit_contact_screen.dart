import 'package:flutter/material.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/controllers/add_or_edit_contact_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/views/widgets/add_or_edit_profile_screen_appbar_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/views/widgets/add_or_edit_screen_circle_avatar_Widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/views/widgets/photo_change_and_remove_button.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/controllers/view_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/widgets/houzeo_bnb_loading_button.dart';
import 'package:houzeo_app/presentation/widgets/houzeo_text_form_field.dart';
import 'package:houzeo_app/utils/constants/paddings.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:provider/provider.dart';

class AddOrEditContactScreen extends StatefulWidget {
  final int? id;
  const AddOrEditContactScreen({super.key, this.id});

  @override
  State<AddOrEditContactScreen> createState() => _AddOrEditContactScreenState();
}

class _AddOrEditContactScreenState extends State<AddOrEditContactScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ContactModel? contact;
  late final AddOrEditContactScreenController controller;

  @override
  void initState() {
    controller =
        Provider.of<AddOrEditContactScreenController>(context, listen: false);
    if (widget.id != null) {
      final allContacts =
          Provider.of<ViewContactsScreenController>(context, listen: false)
              .allContacts;
      final currentContact =
          allContacts.firstWhere((element) => element.id == widget.id);
      firstNameController.text = currentContact.firstName;
      lastNameController.text = currentContact.lastName ?? '';
      companyNameController.text = currentContact.companyName ?? '';
      phoneController.text = currentContact.phoneNumber;
      emailController.text = currentContact.email ?? '';
      contact = currentContact;
    }
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    companyNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    controller.image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AddOrEditContactScreenAppBarWidget(isAdd: widget.id == null),
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  sizedBoxHeight60,
                  const AddOrEditProfileScreenCircleAvatarWidget(),
                  sizedBoxHeight05,
                  PhotoChangeAndRemoveButton(
                      controller: controller,
                      isAdd: widget.id == null,
                      image: contact?.profilePic),
                  sizedBoxHeight40,
                  Padding(
                    padding: extraPadding,
                    child: Column(
                      children: [
                        HouzeoTextFormField(
                            controller: firstNameController,
                            label: 'First name',
                            prefixIcon: Icons.person_outline),
                        sizedBoxHeight20,
                        HouzeoTextFormField(
                            controller: lastNameController,
                            label: 'Last name',
                            prefixIcon: Icons.person_outline,
                            isRequired: false),
                        sizedBoxHeight20,
                        HouzeoTextFormField(
                            controller: companyNameController,
                            label: 'Company',
                            prefixIcon: Icons.apartment_outlined,
                            isRequired: false),
                        sizedBoxHeight20,
                        MobileNumberTextFormField(
                            controller: phoneController,
                            label: 'Phone (Phone)'),
                        sizedBoxHeight20,
                        HouzeoTextFormField(
                            controller: emailController,
                            label: 'Email',
                            prefixIcon: Icons.email_outlined,
                            isRequired: false,
                            isLast: true)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: HouzeoBNBLoadingButton(
        text: widget.id == null ? 'Add Contact' : 'Update Contact',
        onPressed: (startLoading, stopLoading, buttonState) async {
          if (_formKey.currentState!.validate()) {
            startLoading();
            if (widget.id == null) {
              await controller.addContact(
                  context,
                  firstNameController.text,
                  lastNameController.text,
                  companyNameController.text,
                  phoneController.text,
                  emailController.text);
            } else {
              await controller.updateContact(
                  context,
                  ContactModel(
                      id: contact!.id,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      companyName: companyNameController.text,
                      phoneNumber: phoneController.text,
                      email: emailController.text,
                      profilePic: contact!.profilePic,
                      isFavorite: contact!.isFavorite));
            }
            stopLoading();
          }
        },
      ),
    );
  }
}
