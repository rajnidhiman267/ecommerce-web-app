import 'dart:developer';

import 'package:ecommerce_admin_panel/data/repositories/authentication/authentication_repositoary.dart';
import 'package:ecommerce_admin_panel/data/repositories/user/user_repository.dart';
import 'package:ecommerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:ecommerce_admin_panel/features/authentication/model/user_model.dart';
import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/helpers/loaders.dart';
import 'package:ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? '';
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? '';
  }

  Future<void> emailAndPassword() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        "Logging you in....",
        TImages.animationLoader,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }
      //login the user
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      final user = await UserController.instance.fetchUserDetails();
      //  remove loader
      TFullScreenLoader.stopLoading();

      if (user.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        TLoaders.errorSnackBar(
          title: "Not Authorized",
          message: "You are not authorized or do have access. Contact admin",
        );
        return;
      } else {
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      log(e.toString());
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "on Snap", message: e.toString());
    }
  }

  Future<void> registeredAdmin() async {
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        TFullScreenLoader.openLoadingDialog(
          "Registering Admin Account....",
          TImages.animationLoader,
        );
      });
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Register the user
      await AuthenticationRepository.instance.registerEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      // Wait and verify auth user exists
      final authUser = AuthenticationRepository.instance.authUser;
      if (authUser == null) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: "Error",
          message: "Authentication failed.",
        );
        return;
      }
      //craete the admin record in firestore
      // final userRepository = Get.put(UserRepository());
      await UserRepository.instance.createUser(
        UserModel(
          id: authUser.uid,
          email: authUser.email ?? '',
          firstName: "Rajni",
          lastName: "Admin",
          role: AppRole.admin,
          createdAt: DateTime.now(),
        ),
      );
      // remove loader
      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      log(e.toString());
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "on Snap", message: e.toString());
    }
  }
}
