import 'package:ecommerce_admin_panel/common/widgets/containers/t_rounded_container.dart';
import 'package:ecommerce_admin_panel/features/dashboard/screens/dashboard/widget/header_widget.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class DashboardDesktopTablet extends StatelessWidget {
  const DashboardDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "Dashboard",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                children: [
                  TRoundedContainer(
                    padding: EdgeInsets.all(TSizes.lg),
                    child: Column(
                      children: [
                        THeaderWidget(
                          title: "Sales",
                          textColor: AppColors.primaryButtonColor,
                        ),
                        SizedBox(height: TSizes.spaceBtwSections),
                        Row(
                          children: [
                            Text(
                              '\$256.0',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DummyClass extends DataTableSource {
//   final DashboardController controller = Get.put(DashboardController());
//   @override
//   DataRow? getRow(int index) {
//     final data = controller.filteredDataList[index];
//     return DataRow2(
//       onTap: () {},
//       selected: controller.selectedRows[index],
//       onSelectChanged: (value) {
//         controller.selectedRows[index] = value ?? false;
//       },
//       cells: [
//         DataCell(Text(data['Column1'] ?? '')),
//         DataCell(Text(data['Column2'] ?? '')),
//         DataCell(Text(data['Column3'] ?? '')),
//         DataCell(Text(data['Column4'] ?? '')),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => 36;

//   @override
//   int get selectedRowCount => 0;
// }

// class DashboardController extends GetxController {
//   var dataList = <Map<String, String>>[].obs;
//   var filteredDataList = <Map<String, String>>[].obs;
//   RxList<bool> selectedRows = <bool>[].obs;

//   RxInt sortColumnIndex = 1.obs;
//   RxBool sortAscending = true.obs;

//   final TextEditingController searchTextCtrl = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchDummyData();
//   }

//   void sortByID(int columnIndex, bool ascending) {
//     sortAscending.value = ascending;
//     filteredDataList.sort((a, b) {
//       if (ascending) {
//         return filteredDataList[0]['Column1']
//             .toString()
//             .toLowerCase()
//             .compareTo(filteredDataList[0]['Column1'].toString().toLowerCase());
//       } else {
//         return filteredDataList[0]['Column1']
//             .toString()
//             .toLowerCase()
//             .compareTo(filteredDataList[0]['Column1'].toString().toLowerCase());
//       }
//     });
//     sortColumnIndex.value = columnIndex;
//   }

//   void searchQuery(String query) {
//     filteredDataList.assignAll(
//       dataList.where((item) => item['Column1']!.contains(query.toLowerCase())),
//     );
//   }

//   void fetchDummyData() {
//     selectedRows.assignAll(List.generate(36, (index) => false));
//     dataList.addAll(
//       List.generate(
//         36,
//         (index) => {
//           'Column1': 'Data ${index + 1} - 1',
//           'Column2': 'Data ${index + 1} - 2',
//           'Column3': 'Data ${index + 1} - 3',
//           'Column4': 'Data ${index + 1} - 4',
//         },
//       ),
//     );
//     filteredDataList.addAll(
//       List.generate(
//         36,
//         (index) => {
//           'Column1': 'Data ${index + 1} - 1',
//           'Column2': 'Data ${index + 1} - 2',
//           'Column3': 'Data ${index + 1} - 3',
//           'Column4': 'Data ${index + 1} - 4',
//         },
//       ),
//     );
//   }
// }
