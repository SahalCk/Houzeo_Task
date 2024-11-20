import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:houzeo_app/data/data_sources/local_data_source.dart';
import 'package:houzeo_app/model/entities/main_screen/contact_model.dart';

class ViewContactsScreenController with ChangeNotifier {
  bool isAlreadyFetched = false;
  List<ContactModel> allContacts = [];
  Map<String, List<ContactModel>> groupedContacts = {};

  Future<Map<String, List<ContactModel>>> getAllContacts(
      BuildContext context) async {
    allContacts = await HouzeoLocalDBFunctions().getAllContacts(context);

    groupedContacts = {
      for (var letter in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')) letter: []
    };

    for (var contact in allContacts) {
      if (contact.firstName.isNotEmpty) {
        String firstLetter = contact.firstName[0].toUpperCase();

        if (groupedContacts.containsKey(firstLetter)) {
          groupedContacts[firstLetter]!.add(contact);
        }
      }
    }

    groupedContacts.forEach((key, value) {
      value.sort((a, b) => a.firstName.compareTo(b.firstName));
    });
    const notFoundSvg = SvgAssetLoader('assets/contact_not_found.svg');
    svg.cache.putIfAbsent(
        notFoundSvg.cacheKey(null), () => notFoundSvg.loadBytes(null));
    const searchNotFoundSvg = SvgAssetLoader('assets/search_not_found.svg');
    svg.cache.putIfAbsent(searchNotFoundSvg.cacheKey(null),
        () => searchNotFoundSvg.loadBytes(null));
    isAlreadyFetched = true;
    return groupedContacts;
  }

  void refreshScreen() {
    notifyListeners();
  }
}
