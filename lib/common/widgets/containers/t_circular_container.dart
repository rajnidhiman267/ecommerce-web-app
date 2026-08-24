import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.radius = TSizes.cardRadiusLg,
    this.width = 400,
    this.height = 400,
    this.showBorder = false,
    this.borderColor = TColors.borderPrimary,
    this.margin,
    this.padding = const EdgeInsets.all(TSizes.md),
    this.backgroundColor = TColors.whiteColor,
  });
  final Widget? child;
  final double radius;
  final double? width;
  final double? height;
  final bool showBorder;

  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
