import 'package:flutter/material.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/controllers/view_favorite_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/views/widgets/favorite_contact_title_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/views/widgets/favorite_contact_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/views/widgets/no_favorite_contacts_widget.dart';
import 'package:houzeo_app/presentation/widgets/loading_widegts.dart';
import 'package:houzeo_app/presentation/widgets/something_went_wrong_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewFavoriteContactsScreen extends StatelessWidget {
  const ViewFavoriteContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ViewFavoriteContactsScreenController>(
        context,
        listen: false);
    return Scaffold(
      body: Consumer<ViewFavoriteContactsScreenController>(
          builder: (context, value, child) {
        return !value.isAleradyFetched
            ? FutureBuilder(
                future: controller.getAllFavoriteContacts(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return FavoriteContactsGridViewWidget(
                          contacts: snapshot.data!);
                    } else {
                      return const SomethingWentWrongWidget();
                    }
                  } else {
                    return const LoadingWidget();
                  }
                },
              )
            : FavoriteContactsGridViewWidget(contacts: value.favoriteContacts);
      }),
    );
  }
}

class FavoriteContactsGridViewWidget extends StatelessWidget {
  final List<ContactModel> contacts;
  const FavoriteContactsGridViewWidget({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return contacts.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const FavoriteContactTitleWidget(),
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.only(
                        top: 12,
                        left: Adaptive.w(4.5),
                        right: Adaptive.w(4.5),
                        bottom: Adaptive.h(12)),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemBuilder: (context, index) {
                      return FavoriteContactWidget(contact: contacts[index]);
                    },
                    itemCount: contacts.length),
              ),
            ],
          )
        : const NoFavoriteContactsFoundWidget();
  }
}
