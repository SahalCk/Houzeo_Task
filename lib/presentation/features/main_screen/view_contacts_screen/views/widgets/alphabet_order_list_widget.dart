import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/views/widgets/contact_widget.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:houzeo_app/utils/constants/paddings.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlphabetOrderListWidget extends StatelessWidget {
  final String alphabet;
  const AlphabetOrderListWidget({super.key, required this.alphabet});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: defaultPadding,
      sliver: SliverStickyHeader(
        overlapsContent: true,
        header: AlphabetOrderListHeaderWidget(alphabet: alphabet),
        sliver: SliverPadding(
            padding: const EdgeInsets.only(left: 45, bottom: 12),
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                return const ContactWidget();
              },
              separatorBuilder: (context, index) {
                return sizedBoxHeight03;
              },
              itemCount: 30,
            )),
      ),
    );
  }
}

class AlphabetOrderListHeaderWidget extends StatelessWidget {
  const AlphabetOrderListHeaderWidget({
    super.key,
    required this.alphabet,
  });

  final String alphabet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Adaptive.h(1.4), horizontal: Adaptive.w(2)),
      child: Text(alphabet,
          style: TextStyle(
              color: lightThmePrimaryColor,
              fontSize: 18.5.sp,
              fontWeight: FontWeight.w600)),
    );
  }
}
