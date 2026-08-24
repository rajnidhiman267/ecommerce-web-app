import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routes/routes.dart';
import '../layouts/headers/page_heading.dart';

class BreadcrumbWithHeading extends StatelessWidget {
  const BreadcrumbWithHeading({
    super.key,
    required this.heading,
    required this.breadCrumbsItems,
    this.returnToPreviousScreen = false,
  });

  ///The heading for the page

  final String heading;

  ///List of breadcrumbs items representing the navigation path
  final List<String> breadCrumbsItems;

  ///Flag indicating whether to include a button to return to the previous screen
  final bool returnToPreviousScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //breadCrumbs
        Row(
          children: [
            InkWell(
              onTap: () => Get.offAllNamed(TRoute.dashBoard),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.xs),
                child: Text(
                  'Dashboard',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.apply(fontWeightDelta: -1),
                ),
              ),
            ),
            for (int i = 0; i < breadCrumbsItems.length; i++)
              Row(
                children: [
                  const Text('/'),
                  InkWell(
                    //last item should not be clicked
                    onTap: i == breadCrumbsItems.length - 1
                        ? null
                        : () =>
                              () => Get.offAllNamed(breadCrumbsItems[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.xs),
                      //format  breadCrumb item: capitalized and remove leading '/'
                      child: Text(
                        i == breadCrumbsItems.length - 1
                            ? breadCrumbsItems[i].capitalize.toString()
                            : capitalize(breadCrumbsItems[i].substring((1))),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.apply(fontWeightDelta: -1),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: TSizes.sm),
        //Heading of the page
        Row(
          children: [
            if (returnToPreviousScreen) ...[
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
              ),

              SizedBox(width: TSizes.spaceBtwItems),
            ],
            PageHeading(heading: heading),
          ],
        ),
      ],
    );
  }

  String capitalize(String s) {
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}
