import 'package:ecommerce_admin_panel/common/widgets/animation_loader_widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    // Future.delayed(Duration.zero, () {
    if (Get.overlayContext != null) {
      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        barrierColor: Colors.black54,
        builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: Get.isDarkMode ? Colors.black : Colors.white,
            // width: double.infinity,
            // height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 250),
                AnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      );
    }
    // );
  }

  static void popUpCircular() {
    Get.defaultDialog(
      title: "",
      onWillPop: () async => false,
      // content: TCircularLoader(),
      backgroundColor: Colors.transparent,
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
