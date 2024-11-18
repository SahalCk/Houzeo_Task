import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/paddings.dart';
import 'package:houzeo_app/utils/constants/sized_boxes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactSettingsWidget extends StatelessWidget {
  const ContactSettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxHeight20,
          const Divider(),
          sizedBoxHeight15,
          Padding(
            padding: defaultPadding,
            child: Text('Contact settings',
                style:
                    TextStyle(fontSize: 16.3.sp, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 5),
          ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: Text('Settings ${index + 1}'),
                );
              },
              separatorBuilder: (context, index) => sizedBoxHeight05,
              itemCount: 10),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 35),
        ],
      ),
    );
  }
}
