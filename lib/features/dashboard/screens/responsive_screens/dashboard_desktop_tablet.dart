import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class DashboardDesktopTablet extends StatelessWidget {
  const DashboardDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PaginatedDataTable2(
          // decoration: BoxDecoration(
          //   border: Border.all(color: AppColors.billsColor),
          // ),
          columnSpacing: 12,
          minWidth: 786,
          dividerThickness: 0,
          horizontalMargin: 12,
          dataRowHeight: 50,
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateColor.resolveWith(
            (s) => AppColors.educationColor,
          ),
          headingRowDecoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes.borderRadiusMd),
              topRight: Radius.circular(TSizes.borderRadiusMd),
            ),
          ),
          // showHeadingCheckBox: true,
          columns: [
            DataColumn2(label: Text("Column 1")),
            DataColumn2(label: Text("Column 2")),
          ],
          // rows: [
          //   DataRow(
          //     cells: [DataCell(Text('Cell 1')), DataCell(Text('Cell 2'))],
          //   ),
          //   DataRow(
          //     cells: [DataCell(Text('Cell 1')), DataCell(Text('Cell 2'))],
          //   ),
          // ],
          source: DummyClass(),
        ),
      ),
    );
  }
}

class DummyClass extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [DataCell(Text("Data")), DataCell(Text("Data"))]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 36;

  @override
  int get selectedRowCount => 0;
}
