import 'package:ecommerce_admin_panel/bindings/general_binding.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:ecommerce_admin_panel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: TAppRoute.pages,
      initialRoute: TRoute.dashBoard,
      initialBinding: GeneralBinding(),

      // navigatorObservers: RouteObservers,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => Scaffold(body: Center(child: Text("Page Not Found"))),
      ),
      // home: Scaffold(body: Center(child: Text("ADMIN PANEL"))),
    );
  }
}
