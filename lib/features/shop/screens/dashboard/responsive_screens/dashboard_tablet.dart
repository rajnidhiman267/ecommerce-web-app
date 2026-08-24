import 'package:ecommerce_admin_panel/common/widgets/containers/t_rounded_container.dart';
import 'package:ecommerce_admin_panel/features/shop/screens/dashboard/widget/dashboard_card.dart';
import 'package:ecommerce_admin_panel/features/shop/screens/dashboard/widget/order_status_graph.dart';
import 'package:ecommerce_admin_panel/features/shop/screens/dashboard/widget/weekly_sales.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({super.key});

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
              const SizedBox(height: TSizes.spaceBtwSections),
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
                ],
              ),

              Row(
                spacing: TSizes.spaceBtwItems,
                children: [
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

              //BAR GRAPH
              WeeklySalesGraph(),

              ///ORDER
              TRoundedContainer(),

              ///Pie Chart
              OrderStatusPieGraph(),
            ],
          ),
        ),
      ),
    );
  }
}
