import 'package:flutter/material.dart';
import 'package:houzeo_app/data/data_sources/providers.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_config.dart';
import 'package:houzeo_app/presentation/theme/theme_mode_controller.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeModeController(),
    child: const HouzeoApp(),
  ));
}

class HouzeoApp extends StatelessWidget {
  const HouzeoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, oienetation, screenType) {
      return MultiProvider(
          providers: HouzeoProviders().getAllProviders(context),
          builder: (context, child) {
            return MaterialApp.router(
                title: 'Houzeo',
                debugShowCheckedModeBanner: false,
                theme: Provider.of<ThemeModeController>(context).themeData,
                routerConfig: HouzeoRouteConfig.router);
          });
    });
  }
}
