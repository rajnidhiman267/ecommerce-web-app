import 'package:ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(
          bottom: BorderSide(width: 1, color: AppColors.borderColor),
        ),
      ),
      child: AppBar(
        leading: !TDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                icon: const Icon(Iconsax.menu),
              )
            : null,
        title: TDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.search_normal),
                    hintText: "Search anything....",
                  ),
                ),
              )
            : null,
        actions: [
          if (!TDeviceUtils.isDesktopScreen(context))
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.search_normal),
            ),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              TRoundedImage(
                width: 40,
                padding: 2,
                height: 40,
                imageType: ImageType.asset,
                image: TImages.userImage,
              ),
              SizedBox(width: TSizes.sm),
              if (TDeviceUtils.isDesktopScreen(context))
                Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Coding with t",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "support@codingwith.com",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60 + 15);
}
