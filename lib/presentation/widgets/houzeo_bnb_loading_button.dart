import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HouzeoBNBLoadingButton extends StatelessWidget {
  final String text;
  final double? height;
  final Function(
          Function startLoading, Function stopLoading, ButtonState buttonState)
      onPressed;
  const HouzeoBNBLoadingButton(
      {super.key, required this.text, this.height, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(4.5), vertical: Adaptive.w(3)),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(1, 1),
            blurStyle: BlurStyle.outer,
            blurRadius: 3,
            color: blackColor.withOpacity(0.15))
      ]),
      child: LoadingBtn(
          height: height ?? 55,
          width: Adaptive.w(100),
          color: primaryColor,
          borderRadius: 9,
          onTap: onPressed,
          roundLoadingShape: false,
          loader: const SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                  color: whiteColor,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 3.4)),
          child: Text(
            text,
            style: TextStyle(fontSize: 17.5.sp, color: whiteColor),
          )),
    );
  }
}
