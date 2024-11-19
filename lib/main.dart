import 'package:flutter/material.dart';
import 'package:houzeo_app/data/data_sources/local_data_source.dart';
import 'package:houzeo_app/data/data_sources/providers.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_config.dart';
import 'package:houzeo_app/presentation/theme/houzeo_theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HouzeoLocalDBFunctions().openHouzeoLocalDB();
  runApp(const HouzeoApp());
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
                theme: HouzeoAppTheme().getThemeData,
                routerConfig: HouzeoRouteConfig.router);
          });
    });
  }
}
