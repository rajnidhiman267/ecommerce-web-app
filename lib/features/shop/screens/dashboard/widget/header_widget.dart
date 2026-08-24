import 'package:flutter/material.dart';

class THeaderWidget extends StatelessWidget {
  const THeaderWidget({
    super.key,
    this.rightSideWidget,
    this.textColor,
    required this.title,
  });
  final Widget? rightSideWidget;
  final Color? textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.apply(color: textColor),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        if (rightSideWidget != null) rightSideWidget!,
      ],
    );
  }
}
