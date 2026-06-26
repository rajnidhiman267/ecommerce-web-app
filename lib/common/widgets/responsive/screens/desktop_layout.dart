import 'package:ecommerce_admin_panel/app.dart';
import 'package:ecommerce_admin_panel/common/widgets/layouts/headers/header.dart';
import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: TSideBar()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                THeader(),
                body ??
                    TContainer(
                      color: AppColors.entertainmentColor,
                      height: 500,
                      width: double.infinity,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
