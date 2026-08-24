import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.radius = TSizes.cardRadiusLg,
    this.width,
    this.height,
    this.showBorder = false,
    this.showShadow = true,
    this.borderColor = TColors.darkSurface,
    this.margin,
    this.padding = const EdgeInsetsGeometry.all(TSizes.md),
    this.backgroundColor = TColors.whiteColor,
    this.onTap,
  });
  final Widget? child;
  final double radius;
  final double? width;
  final double? height;
  final bool showBorder;
  final bool showShadow;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final void Function()? onTap;
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
        boxShadow: [
          if (showShadow)
            BoxShadow(
              color: TColors.hintTextColor.withValues(alpha: 0.1),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: child,
    );
  }
}
