import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });
  final String route;
  final IconData icon;
  final String itemName;
  @override
  Widget build(BuildContext context) {
 
      final menuController = Get.find<SidebarController>();
    return InkWell(
      onTap: () {
        menuController.menOnTap(route);
      },
      onHover: (hovering) => hovering
          ? menuController.chnageHoverItem(route)
          : menuController.chnageHoverItem(""),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color:
                  menuController.isHovering(route) ||
                      menuController.isActive(route)
                  ? AppColors.primaryDark
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: TSizes.lg,
                    top: TSizes.md,
                    right: TSizes.md,
                    bottom: TSizes.md,
                  ),
                  child: menuController.isActive(route)
                      ? Icon(icon, size: 22, color: AppColors.whiteColor)
                      : Icon(
                          icon,
                          size: 22,
                          color: menuController.isHovering(route)
                              ? AppColors.whiteColor
                              : AppColors.darkBorder,
                        ),
                ),
                if (menuController.isHovering(route) ||
                    menuController.isActive(route))
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  )
                else
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: AppColors.darkBorder,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
