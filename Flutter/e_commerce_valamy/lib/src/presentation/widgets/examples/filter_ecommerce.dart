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
  late Set<String> selectedTags;

  final List<String> allTags = [
    'Nuevo',
    'Recomendado',
    'Popular',
    'En oferta',
    'Limitado',
    'Top ventas',
    'Favoritos',
    'Exclusivo',
  ];

  @override
  void initState() {
    super.initState();
    showOnlyAvailable = widget.initialFilters['available'] ?? false;
    selectedCategory = widget.initialFilters['category'] ?? 'Todos';
    priceRange =
        widget.initialFilters['priceRange'] ?? const RangeValues(0, 100);
    selectedTags = Set<String>.from(widget.initialFilters['tags'] ?? {});
  }

  void _toggleTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // 🔹 Encabezado
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

              // 🔹 Contenido scrolleable
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitchListTile(
                        title: const Text('Solo disponibles'),
                        value: showOnlyAvailable,
                        onChanged: (v) => setState(() => showOnlyAvailable = v),
                      ),
                      const SizedBox(height: 10),

                      const Text('Categoría'),
                      DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        onChanged: (v) => setState(() => selectedCategory = v!),
                        items: const [
                          DropdownMenuItem(
                            value: 'Todos',
                            child: Text('Todos'),
                          ),
                          DropdownMenuItem(
                            value: 'Electrónica',
                            child: Text('Electrónica'),
                          ),
                          DropdownMenuItem(value: 'Ropa', child: Text('Ropa')),
                          DropdownMenuItem(
                            value: 'Hogar',
                            child: Text('Hogar'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

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
                        onChanged: (v) => setState(() => priceRange = v),
                      ),
                      const SizedBox(height: 15),

                      const Text('Etiquetas'),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            allTags.map((tag) {
                              final selected = selectedTags.contains(tag);
                              return FilterChip(
                                label: Text(tag),
                                selected: selected,
                                selectedColor: theme.colorScheme.primary
                                    .withOpacity(0.2),
                                checkmarkColor: theme.colorScheme.primary,
                                onSelected: (_) => _toggleTag(tag),
                              );
                            }).toList(),
                      ),
                      const SizedBox(
                        height: 100,
                      ), // espacio inferior para los botones
                    ],
                  ),
                ),
              ),

              // 🔹 Botones fijos al final
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
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
                            'tags': selectedTags.toList(),
                          });
                        },
                        child: const Text('Aplicar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
