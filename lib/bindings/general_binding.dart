import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:ecommerce_admin_panel/data/repositories/user/user_repository.dart';
import 'package:ecommerce_admin_panel/features/authentication/controllers/login_controller.dart';
import 'package:ecommerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => SidebarController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}
