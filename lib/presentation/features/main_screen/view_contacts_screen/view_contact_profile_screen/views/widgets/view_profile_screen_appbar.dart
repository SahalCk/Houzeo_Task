import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_names.dart';

class ViewProfileScreenAppBarWidget extends StatelessWidget {
  const ViewProfileScreenAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              context.pushNamed(HouzeoRouteNames.editContactScreen);
            },
            icon: const Icon(Icons.mode_edit_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.star_border)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))
      ],
    );
  }
}
