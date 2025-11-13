import 'package:flutter/material.dart';

class FilterBottomSheet2 extends StatefulWidget {
  const FilterBottomSheet2({super.key});

  @override
  State<FilterBottomSheet2> createState() => _FilterBottomSheet2State();
}

class _FilterBottomSheet2State extends State<FilterBottomSheet2> {
  String? selectedCategory;
  RangeValues priceRange = const RangeValues(50, 500);
  String? selectedLocation;

  // void _aplicarFiltros() {
  //   // Aquí puedes usar los valores seleccionados para filtrar tu lista
  //   debugPrint('Categoría: $categoriaSeleccionada');
  //   debugPrint('Orden: $ordenSeleccionado');
  //   debugPrint('Precio: ${rangoPrecio.start} - ${rangoPrecio.end}');
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeihgt = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        height: screenHeihgt * 0.88,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const Text(
                'Filtros',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Botón para categoría
              _FilterMenuButton(
                title: 'Categoría',
                subtitle: selectedCategory ?? 'Seleccionar',
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CategoryFilterScreen(),
                    ),
                  );
                  if (result != null) {
                    setState(() => selectedCategory = result);
                  }
                },
              ),
              const Divider(),

              // Botón para precio
              _FilterMenuButton(
                title: 'Rango de precios',
                subtitle:
                    '\$${priceRange.start.round()} - \$${priceRange.end.round()}',
                onTap: () async {
                  // final result = await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder:
                  //         (_) => PriceFilterScreen(initialRange: priceRange),
                  //   ),
                  // );
                  // if (result != null) {
                  //   setState(() => priceRange = result);
                  // }
                },
              ),
              const Divider(),

              // Botón para ubicación
              _FilterMenuButton(
                title: 'Ubicación',
                subtitle: selectedLocation ?? 'Seleccionar',
                onTap: () async {
                  // final result = await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => const LocationFilterScreen(),
                  //   ),
                  // );
                  // if (result != null) {
                  //   setState(() => selectedLocation = result);
                  // }
                },
              ),
              const SizedBox(height: 30),

              // Botones de acción
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = null;
                          selectedLocation = null;
                          priceRange = const RangeValues(50, 500);
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Limpiar'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Aplicar'),
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

class _FilterMenuButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _FilterMenuButton({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class CategoryFilterScreen extends StatelessWidget {
  const CategoryFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Ropa', 'Electrónica', 'Hogar', 'Deportes', 'Libros'];

    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Categoría')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () => Navigator.pop(context, categories[index]),
          );
        },
      ),
    );
  }
}
