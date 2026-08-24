import 'package:ecommerce_admin_panel/common/widgets/containers/t_rounded_container.dart';
import 'package:ecommerce_admin_panel/features/shop/controller/dashboard/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/features/shop/screens/dashboard/widget/dashboard_card.dart';
import 'package:ecommerce_admin_panel/features/shop/screens/dashboard/widget/header_widget.dart';
import 'package:ecommerce_admin_panel/features/shop/screens/dashboard/widget/order_status_graph.dart';
import 'package:ecommerce_admin_panel/features/shop/screens/dashboard/widget/weekly_sales.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.spaceBtwSections,
            crossAxisAlignment: .start,
            children: [
              Text(
                "Dashboard",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              // const SizedBox(height: TSizes.spaceBtwSections),

              ///CARDS
              Row(
                spacing: TSizes.spaceBtwItems,
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Sales total',
                      subTitle: '\$365.6',
                      stats: 25,
                    ),
                  ),

                  Expanded(
                    child: DashboardCard(
                      title: 'Average Order Value',
                      subTitle: '\$25',

                      stats: 15,
                    ),
                  ),
                  Expanded(
                    child: DashboardCard(
                      title: 'Total Orders',
                      subTitle: '36',

                      stats: 44,
                    ),
                  ),
                  Expanded(
                    child: DashboardCard(
                      title: 'Visitors',
                      subTitle: '25,035',

                      stats: 2,
                    ),
                  ),
                ],
              ),

              ///GRAPHS
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: TSizes.spaceBtwSections,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      spacing: TSizes.spaceBtwSections,
                      children: [
                        //BAR GRAPH
                        WeeklySalesGraph(),

                        //ORDER
                        TRoundedContainer(),
                      ],
                    ),
                  ),
                  //Pie Chart
                  Expanded(child: OrderStatusPieGraph()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
