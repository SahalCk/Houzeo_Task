import 'package:flutter/material.dart';
import 'package:houzeo_app/presentation/features/main_screen/views/controllers/main_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HouzeoProviders {
  List<SingleChildWidget> getAllProviders(BuildContext context) {
    return [
      ChangeNotifierProvider(create: (context) => MainScreenController())
    ];
  }
}
