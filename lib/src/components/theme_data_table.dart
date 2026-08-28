import 'package:flutter/material.dart';

class ThemeDataTable extends StatelessWidget {
  const ThemeDataTable({super.key, required this.columns, required this.rows});

  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final stripe = Color.alphaBlend(
        scheme.onSurface.withValues(alpha: 0.035), scheme.surface);

    final stripedRows = [
      for (var i = 0; i < rows.length; i++)
        if (rows[i].color != null)
          rows[i]
        else
          DataRow(
            key: rows[i].key,
            selected: rows[i].selected,
            onSelectChanged: rows[i].onSelectChanged,
            color: i.isOdd ? WidgetStatePropertyAll(stripe) : null,
            cells: rows[i].cells,
          ),
    ];

    final radius = BorderRadius.circular(12);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: scheme.outline), borderRadius: radius),
      // DataTable paints per-row/heading backgrounds via nested Material/Ink
      // layers that a Container's clipBehavior alone won't round at the
      // bottom corners — an explicit ClipRRect is needed to clip them too.
      child: ClipRRect(
        borderRadius: radius,
        child: DataTable(columns: columns, rows: stripedRows),
      ),
    );
  }
}
