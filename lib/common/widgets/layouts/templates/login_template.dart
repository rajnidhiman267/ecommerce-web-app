import 'package:ecommerce_admin_panel/common/style/spacing_style.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Container(
            padding: SpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.darkCard
                  : TColors.whiteColor,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
