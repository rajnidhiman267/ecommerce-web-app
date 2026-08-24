import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/common/widgets/animation_loader_widget.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TPaginatedDataTable extends StatelessWidget {
  const TPaginatedDataTable({
    super.key,
    this.sortAscending = true,
    this.sortColumnIndex,
    this.rowsPerPage = 10,
    required this.source,
    required this.columns,
    this.onPageChanged,
    this.dataRowHeight = TSizes.xl * 2,
    this.tableHeight = 760,
    this.minWidth = 1000,
  });

  final bool sortAscending;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final DataTableSource source;
  final List<DataColumn> columns;
  final Function(int)? onPageChanged;
  final double dataRowHeight;
  final double tableHeight;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      columns: columns,
      source: source,
      columnSpacing: 12,
      minWidth: minWidth,
      dividerThickness: 0,
      rowsPerPage: rowsPerPage,
      horizontalMargin: 12,
      dataRowHeight: dataRowHeight,
      renderEmptyRowsInTheEnd: false,
      headingTextStyle: Theme.of(
        context,
      ).textTheme.titleMedium?.apply(color: TColors.whiteColor),
      headingRowColor: WidgetStateColor.resolveWith(
        (s) => TColors.primaryButtonColor,
      ),
      empty: AnimationLoaderWidget(
        text: "Nothing found",
        animation: TImages.animationLoader,
      ),
      headingRowDecoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.borderRadiusMd),
          topRight: Radius.circular(TSizes.borderRadiusMd),
        ),
      ),
      //Pagination
      showCheckboxColumn: true,
      showFirstLastButtons: true,
      onPageChanged: onPageChanged,

      //sorting
      sortAscending: sortAscending,
      sortArrowAlwaysVisible: true,
      sortArrowIcon: Icons.line_axis,
      sortColumnIndex: sortColumnIndex,
      sortArrowBuilder: (ascending, sorted) {
        if (sorted) {
          return Icon(
            ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
            size: TSizes.iconSm,
          );
        } else {
          return const Icon(Iconsax.arrow_3, size: TSizes.iconSm);
        }
      },
    );
  }
}
