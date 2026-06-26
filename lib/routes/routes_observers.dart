import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteObservers extends GetObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final sideController = Get.put(SidebarController());
    if (previousRoute != null) {
      for (var routeName in TRoute.sideMenuItem) {
        if (previousRoute.settings.name == routeName) {
          sideController.activeItem.value = routeName;
        }
      }
    }
  }
}
