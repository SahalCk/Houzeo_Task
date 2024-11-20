import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houzeo_app/utils/constants/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class HouzeoTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? inputType;
  final bool? isLast;
  final bool? isRequired;
  final IconData? prefixIcon;
  const HouzeoTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      this.inputType,
      this.isLast,
      this.isRequired,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: (value) {
        if ((value == null || value.isEmpty) && isRequired != false) {
          return '$label is empty';
        }
        return null;
      },
      textInputAction:
          isLast == true ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: subTextColor)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: primaryColor, width: 2)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 2)),
          labelText: label,
          labelStyle: const TextStyle(color: subTextColor),
          prefixIcon: Icon(prefixIcon)),
    );
  }
}

class MobileNumberTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? isLast;
  const MobileNumberTextFormField(
      {super.key, required this.controller, required this.label, this.isLast});

  @override
  Widget build(BuildContext context) {
    int limit = 10;
    return IntlPhoneField(
      controller: controller,
      keyboardType: TextInputType.phone,
      disableLengthCheck: true,
      validator: (value) {
        if (value == null || value.number.isEmpty) {
          return '$label is empty';
        } else if (value.number.length > limit || value.number.length < limit) {
          return 'Invalid mobile number';
        }
        return null;
      },

      textInputAction:
          isLast == true ? TextInputAction.done : TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [LengthLimitingTextInputFormatter(limit)],
      initialCountryCode: 'IN',
      dropdownTextStyle: const TextStyle(
          color: Color.fromARGB(255, 26, 26, 26), fontFamily: 'Gilroy-Medium'),
      dropdownDecoration: BoxDecoration(
          shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)),
      flagsButtonMargin: const EdgeInsets.only(left: 10),
      dropdownIconPosition: IconPosition.trailing,
      onCountryChanged: (value) {
        limit = value.maxLength;
      },
      // onChanged: (value) {
      //   controller.text = '${value.countryCode} ${value.number}';
      // },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: subTextColor)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: primaryColor, width: 2)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 2)),
          labelText: label,
          labelStyle: const TextStyle(color: subTextColor)),
    );
  }
}
