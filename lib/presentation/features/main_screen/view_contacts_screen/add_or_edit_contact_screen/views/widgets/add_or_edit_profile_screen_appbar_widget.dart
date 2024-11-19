import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/presentation/widgets/houzeo_icon_button.dart';

class AddOrEditContactScreenAppBarWidget extends StatelessWidget {
  final bool isAdd;
  const AddOrEditContactScreenAppBarWidget({super.key, required this.isAdd});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: HouzeoIconButton(
          onPressed: () {
            context.pop();
          },
          isAppBarBackButton: true,
          icon: Icons.close_outlined),
      titleSpacing: 5,
      title: Text('${isAdd ? 'Add' : 'Edit'} Contact'),
    );
  }
}
