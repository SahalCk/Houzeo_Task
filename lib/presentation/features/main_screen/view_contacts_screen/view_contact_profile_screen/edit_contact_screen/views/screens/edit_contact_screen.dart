import 'package:flutter/material.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/edit_contact_screen/views/widgets/edit_profile_screen_appbar_widget.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';

class EditContactScreen extends StatelessWidget {
  const EditContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EditContactScreenAppBarWidget(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                sizedBoxHeight20,
              ],
            ),
          )
        ],
      ),
    );
  }
}
