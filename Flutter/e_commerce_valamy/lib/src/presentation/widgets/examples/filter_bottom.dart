import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  final Map<String, dynamic> initialFilters;

  const FilterBottomSheet({super.key, required this.initialFilters});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late bool showOnlyAvailable;
  late String selectedCategory;
  late RangeValues priceRange;

  @override
  void initState() {
    super.initState();
    showOnlyAvailable = widget.initialFilters['available'] ?? false;
    selectedCategory = widget.initialFilters['category'] ?? 'Todos';
    priceRange =
        widget.initialFilters['priceRange'] ?? const RangeValues(0, 100);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Filtros',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context, null),
                ),
              ],
            ),
            const Divider(),

            // 🔘 Switch de disponibilidad
            SwitchListTile(
              title: const Text('Solo disponibles'),
              value: showOnlyAvailable,
              onChanged: (value) => setState(() => showOnlyAvailable = value),
            ),
            const SizedBox(height: 10),

            // 🏷 Categoría
            const Text('Categoría'),
            DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              onChanged: (value) => setState(() => selectedCategory = value!),
              items: const [
                DropdownMenuItem(value: 'Todos', child: Text('Todos')),
                DropdownMenuItem(
                  value: 'Electrónica',
                  child: Text('Electrónica'),
                ),
                DropdownMenuItem(value: 'Ropa', child: Text('Ropa')),
                DropdownMenuItem(value: 'Hogar', child: Text('Hogar')),
              ],
            ),
            const SizedBox(height: 10),

            // 💰 Rango de precios
            const Text('Rango de precio'),
            RangeSlider(
              values: priceRange,
              min: 0,
              max: 500,
              divisions: 10,
              labels: RangeLabels(
                '${priceRange.start.toInt()}€',
                '${priceRange.end.toInt()}€',
              ),
              onChanged: (values) => setState(() => priceRange = values),
            ),
            const SizedBox(height: 20),

            // 🔘 Botones
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, null),
                    child: const Text('Cancelar'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        'available': showOnlyAvailable,
                        'category': selectedCategory,
                        'priceRange': priceRange,
                      });
                    },
                    child: const Text('Aplicar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
