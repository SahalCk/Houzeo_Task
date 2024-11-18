import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/utils/constants/colors.dart';

class EditContactScreenAppBarWidget extends StatelessWidget {
  const EditContactScreenAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close, size: 25)),
      titleSpacing: 0,
      title: const Text('Edit Contact'),
      actions: [
        ElevatedButton(
            onPressed: () {},
            child: const Text('Save',
                style: TextStyle(color: lightThemeBackgroundColor))),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
      ],
    );
  }
}
