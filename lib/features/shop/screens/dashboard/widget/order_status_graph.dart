import 'package:ecommerce_admin_panel/common/widgets/containers/t_circular_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/containers/t_rounded_container.dart';
import 'package:ecommerce_admin_panel/features/shop/controller/dashboard/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';

class OrderStatusPieGraph extends StatelessWidget {
  const OrderStatusPieGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: TSizes.spaceBtwSections,
        children: [
          Text(
            'Order Status',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          //Graph
          SizedBox(
            height: 400,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (p0, p1) {
                    //handle touch events here if needed
                  },
                  enabled: true,
                ),
                sections: controller.orderStatusData.entries.map((e) {
                  final status = e.key;
                  final count = e.value;
                  return PieChartSectionData(
                    title: count.toString(),
                    value: count.toDouble(),
                    color: THelperFunctions.getOrderStatusColor(status),
                    radius: 100,
                    titleStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          //Show status and Color meta
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Orders')),
                DataColumn(label: Text('Total')),
              ],
              rows: controller.orderStatusData.entries.map((entry) {
                final OrderStatus status = entry.key;
                final int count = entry.value;
                final totalAmount = controller.totalAmounts[status] ?? 0;
                return DataRow(
                  cells: [
                    DataCell(
                      Row(
                        spacing: TSizes.sm,
                        children: [
                          TCircularContainer(
                            width: 20,
                            height: 20,
                            backgroundColor:
                                THelperFunctions.getOrderStatusColor(status),
                          ),
                          Expanded(
                            child: Text(
                              THelperFunctions.getDisplayStatusName(status),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(Text(count.toString())),
                    DataCell(Text('\$${totalAmount.toStringAsFixed(2)}')),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
