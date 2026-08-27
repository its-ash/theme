import 'package:flutter/material.dart';

class ThemeDataTable extends StatelessWidget {
  const ThemeDataTable({super.key, required this.columns, required this.rows});

  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: columns, rows: rows);
  }
}
