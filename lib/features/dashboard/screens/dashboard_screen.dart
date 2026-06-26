import 'package:ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin_panel/features/dashboard/screens/responsive_screens/dashboard_desktop_tablet.dart';
import 'package:ecommerce_admin_panel/features/dashboard/screens/responsive_screens/dashboard_mobile.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: DashboardDesktopTablet(),
      mobile: DashboardMobile(),
    );
  }
}
