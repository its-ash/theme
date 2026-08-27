import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import '/apps/shoes/components/shoe_card.dart';
import '/models/shoe_model.dart';
import '/models/shoe_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.onShoeTap});

  final ValueChanged<Shoe> onShoeTap;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  List<Shoe> _results = ShoeData.shoes;
  int _selectedFilter = 0;

  void _runSearch(String query) {
    setState(() {
      _results = ShoeData.shoes.where((s) => s.name.toLowerCase().contains(query.toLowerCase()) || s.brand.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ThemeSearchBar(controller: _controller, hintText: 'Search shoes...', onChanged: _runSearch, onSubmitted: _runSearch),
          const SizedBox(height: 16),
          ThemeFilterChipRow(chips: ShoeData.categories, selectedIndex: _selectedFilter, onSelected: (i) => setState(() => _selectedFilter = i)),
          const SizedBox(height: 16),
          Expanded(child: _results.isEmpty ? const Center(child: Text('No shoes found')) : ListView.builder(itemCount: _results.length, itemBuilder: (context, i) => Padding(padding: const EdgeInsets.only(bottom: 12), child: ShoeCard(shoe: _results[i], variant: ShoeCardVariant.list, onTap: () => widget.onShoeTap(_results[i]))))),
        ],
      ),
    );
  }
}
