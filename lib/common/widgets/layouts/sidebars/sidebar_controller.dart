import 'package:ecommerce_admin_panel/data/repositories/authentication/authentication_repositoary.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  final activeItem = TRoute.login.obs;
  final hoverItem = "".obs;

  void changeActiveItem(String route) => activeItem.value = route;
  void chnageHoverItem(String route) {
    if (!isActive(route)) {
      hoverItem.value = route;
    }
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;

  void menOnTap(String route) async {
    if (!isActive(route)) {
      changeActiveItem(route);
      if (TDeviceUtils.isMobileScreen(Get.context!)) Get.back();
      Get.toNamed(route);
    }
    await AuthenticationRepository.instance.logout();
  }
}
