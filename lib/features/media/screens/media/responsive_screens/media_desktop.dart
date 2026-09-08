import 'package:ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin_panel/features/media/screens/media/widget/media_content.dart';
import 'package:ecommerce_admin_panel/features/media/screens/media/widget/media_uploader.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ///Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///BreadCrumbs
                  Expanded(
                    child: BreadcrumbWithHeading(
                      heading: 'Media',
                      breadCrumbsItems: [TRoute.login, TRoute.forgetPassword],
                    ),
                  ),
                  SizedBox(
                    width: TSizes.buttonWidth * 1.5,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.showImagesUploaderSection.value =
                            !controller.showImagesUploaderSection.value;
                      },
                      icon: const Icon(Iconsax.cloud_add),
                      label: Text('Upload Images'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Upload Area
              MediaUploader(),

              ///Media
              MediaContent(),
            ],
          ),
        ),
      ),
    );
  }
}
