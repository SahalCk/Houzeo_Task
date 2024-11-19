import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/controllers/view_favorite_contacts_screen_controller.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_names.dart';
import 'package:houzeo_app/presentation/widgets/houzeo_icon_button.dart';
import 'package:provider/provider.dart';

class ViewProfileScreenAppBarWidget extends StatelessWidget {
  final ContactModel contact;
  const ViewProfileScreenAppBarWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: HouzeoIconButton(
          onPressed: () {
            context.pop();
          },
          isAppBarBackButton: true,
          icon: Icons.arrow_back),
      pinned: true,
      actions: [
        HouzeoIconButton(
            onPressed: () {
              context.pushNamed(HouzeoRouteNames.addOreditContactScreen,
                  pathParameters: {'id': contact.id.toString()});
            },
            icon: Icons.edit_outlined),
        const SizedBox(width: 5),
        FavoriteButton(contact: contact),
        const SizedBox(width: 5),
        HouzeoIconButton(onPressed: () {}, icon: Icons.settings_outlined),
        const SizedBox(width: 10)
      ],
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final ContactModel contact;
  const FavoriteButton({super.key, required this.contact});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  void initState() {
    _isFavorite = widget.contact.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HouzeoIconButton(
        onPressed: () async {
          final status =
              await Provider.of<ViewFavoriteContactsScreenController>(context,
                      listen: false)
                  .addOrRemoveToFavorite(context, widget.contact, !_isFavorite);
          if (status) {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          }
        },
        icon: _isFavorite ? Icons.star : Icons.star_border);
  }
}
