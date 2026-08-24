import 'package:ecommerce_admin_panel/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSideBar extends StatelessWidget {
  const TSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkSurface
              : TColors.whiteColor,
          border: Border(
            right: BorderSide(color: TColors.borderColor, width: 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TCircularImage(width: 100, height: 100, image: TImages.userImage),
              SizedBox(height: TSizes.spaceBtwSections),
              Padding(
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'MENU',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.apply(letterSpacingDelta: 1.2),
                    ),

                    TMenuItem(
                      route: TRoute.login,
                      icon: Iconsax.status,
                      itemName: 'DashBoard',
                    ),
                    TMenuItem(
                      route: TRoute.banners,
                      icon: Iconsax.image,
                      itemName: 'Media',
                    ),
                    TMenuItem(
                      route: TRoute.categories,
                      icon: Iconsax.picture_frame,
                      itemName: 'Banner',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
