import 'dart:developer';

import 'package:ecommerce_admin_panel/data/repositories/user/user_repository.dart';
import 'package:ecommerce_admin_panel/features/authentication/model/user_model.dart';
import 'package:ecommerce_admin_panel/utils/helpers/loaders.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  onInit() {
    fetchUserDetails();
    super.onInit();
  }

  //fetches user details from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      loading.value = true;
      final user = await UserRepository.instance.fetchAdminDetails();
      this.user.value = user;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = false;
      log(e.toString());
      TLoaders.errorSnackBar(
        title: "Something went wrong.",
        message: e.toString(),
      );
      return UserModel.empty();
    }
  }
}
