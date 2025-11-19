import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class RoundedDataTable<T> extends StatelessWidget {
  final List<String> columnLabels;
  final List<T> items;

  /// Devuelve una lista de celdas por fila
  final List<DataCell> Function(T item) cellBuilder;
  final double borderRadius;
  final Color headerColor;
  final Color headerTextColor;
  final double headerTextSize;
  final Color rowColor;
  final Color borderColor;
  final double columnSpacing;

  const RoundedDataTable({
    super.key,
    required this.columnLabels,
    required this.items,
    required this.cellBuilder,
    this.borderRadius = 16,
    this.headerColor = const Color(0xFFF1F1F1),
    this.headerTextColor = blackColor,
    this.headerTextSize = 15,
    this.rowColor = Colors.white,
    this.borderColor = const Color(0xFFDDDDDD),
    this.columnSpacing = 17,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius), // bordes redondeados
        child: DataTable(
          columnSpacing: columnSpacing,
          headingRowColor: WidgetStateProperty.all(headerColor),
          dataRowColor: WidgetStateProperty.all(rowColor),
          headingTextStyle: TextStyle(
            color: headerTextColor,
            fontSize: headerTextSize,
            fontWeight: FontWeight.w500,
          ),
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.grey, width: 1),
            verticalInside: BorderSide(color: Colors.grey, width: 1),
          ),
          columns: [
            for (final label in columnLabels)
              DataColumn(
                label: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                headingRowAlignment: MainAxisAlignment.center,
              ),
          ],
          rows: [for (final item in items) DataRow(cells: cellBuilder(item))],
        ),
      ),
    );
  }
}
