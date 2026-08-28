import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '../showcase_tile.dart';

class PickersSection extends StatefulWidget {
  const PickersSection({super.key});

  @override
  State<PickersSection> createState() => _PickersSectionState();
}

class _PickersSectionState extends State<PickersSection> {
  DateTime? _date;
  TimeOfDay? _time;

  @override
  Widget build(BuildContext context) {
    return ShowcasePage(
      children: [
        ShowcaseTile(
          title: 'ThemeDatePicker',
          child: ThemeButton(
            label: _date == null ? 'Pick a date' : _date!.toLocal().toString().split(' ').first,
            onPressed: () async {
              final picked = await ThemeDatePicker.show(
                context,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
                initialDate: DateTime.now(),
              );
              if (picked != null) setState(() => _date = picked);
            },
          ),
        ),
        ShowcaseTile(
          title: 'ThemeTimePicker',
          child: ThemeButton(
            label: _time == null ? 'Pick a time' : _time!.format(context),
            onPressed: () async {
              final picked = await ThemeTimePicker.show(context, initialTime: TimeOfDay.now());
              if (picked != null) setState(() => _time = picked);
            },
          ),
        ),
        ShowcaseTile(
          title: 'ThemePopupMenu<T>',
          child: ThemePopupMenu<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (_) {},
            items: const [
              PopupMenuItem(value: 'edit', child: Text('Edit')),
              PopupMenuItem(value: 'share', child: Text('Share')),
              PopupMenuItem(value: 'delete', child: Text('Delete')),
            ],
          ),
        ),
      ],
    );
  }
}
