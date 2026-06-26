import 'package:ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
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
      // navigatorObservers: RouteObservers,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => Scaffold(body: Center(child: Text("Page Not Found"))),
      ),
      // home: Scaffold(body: Center(child: Text("ADMIN PANEL"))),
    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: Desktop(),
      tablet: Tablet(),
      mobile: Mobile(),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TContainer(
                color: AppColors.primaryDark,
                height: 500,
                width: 400,
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  TContainer(
                    color: AppColors.billsColor,
                    height: 300,
                    width: 900,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: TContainer(
                          color: AppColors.borderColor,
                          height: 200,
                          width: 500,
                        ),
                      ),
                      Expanded(
                        child: TContainer(
                          color: AppColors.entertainmentColor,
                          height: 200,
                          width: 500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TContainer(
                color: AppColors.borderColor,
                height: 200,
                width: 700,
              ),
            ),
            Expanded(
              child: TContainer(
                color: AppColors.entertainmentColor,
                height: 200,
                width: 700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TContainer(
                color: AppColors.primaryDark,
                height: 500,
                width: 400,
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  TContainer(
                    color: AppColors.billsColor,
                    height: 300,
                    width: 900,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: TContainer(
                          color: AppColors.borderColor,
                          height: 200,
                          width: 500,
                        ),
                      ),
                      Expanded(
                        child: TContainer(
                          color: AppColors.entertainmentColor,
                          height: 200,
                          width: 500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: .min,
          children: [
            TContainer(
              color: AppColors.borderColor,
              height: 200,
              width: double.infinity,
            ),
            TContainer(
              color: AppColors.entertainmentColor,
              height: 200,
              width: double.infinity,
            ),
          ],
        ),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TContainer(
          color: AppColors.primaryDark,
          height: 500,
          width: double.infinity,
        ),

        TContainer(
          color: AppColors.billsColor,
          height: 300,
          width: double.infinity,
        ),

        TContainer(
          color: AppColors.borderColor,
          height: 200,
          width: double.infinity,
        ),
        TContainer(
          color: AppColors.entertainmentColor,
          height: 200,
          width: double.infinity,
        ),
        TContainer(
          color: AppColors.borderColor,
          height: 200,
          width: double.infinity,
        ),
        TContainer(
          color: AppColors.entertainmentColor,
          height: 200,
          width: double.infinity,
        ),
      ],
    );
  }
}

class TContainer extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  const TContainer({
    super.key,
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(color: color),

      child: Center(child: Text("BOX 1")),
    );
  }
}
