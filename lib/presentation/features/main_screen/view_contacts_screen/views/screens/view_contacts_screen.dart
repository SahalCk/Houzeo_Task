import 'package:flutter/material.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/views/widgets/alphabet_order_list_widget.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/views/widgets/create_new_contact_button.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewContactsScreen extends StatelessWidget {
  const ViewContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Container(
            width: Adaptive.w(100),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: lightThemeSearchBarColor,
                borderRadius: BorderRadius.circular(100)),
            child: Flex(
              direction: Axis.horizontal,
              children: [Icon(Icons.search), Expanded(child: TextField())],
            ),
          ),
        ),
        const CreateNewContactButton(),
        const AlphabetOrderListWidget(alphabet: 'A'),
      ],
    ));
  }
}
