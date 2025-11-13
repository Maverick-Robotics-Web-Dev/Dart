import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filtro de Productos',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? selectedCategory;
  double minPrice = 0;
  double maxPrice = 1000;
  bool onlyAvailable = false;
  double minRating = 0;

  void _openFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        // Usamos StatefulBuilder para manejar el estado local del modal
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Filtros de productos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Categoría
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Categoría"),
                    initialValue: selectedCategory,
                    items:
                        ["Electrónica", "Ropa", "Hogar", "Deportes", "Juguetes"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged:
                        (val) => setModalState(() {
                          selectedCategory = val;
                        }),
                  ),
                  const SizedBox(height: 20),

                  // Rango de precio
                  Text(
                    "Rango de precio: \$${minPrice.round()} - \$${maxPrice.round()}",
                  ),
                  RangeSlider(
                    values: RangeValues(minPrice, maxPrice),
                    min: 0,
                    max: 2000,
                    divisions: 40,
                    labels: RangeLabels(
                      "\$${minPrice.round()}",
                      "\$${maxPrice.round()}",
                    ),
                    onChanged: (values) {
                      setModalState(() {
                        minPrice = values.start;
                        maxPrice = values.end;
                      });
                    },
                  ),

                  // Solo disponibles
                  CheckboxListTile(
                    title: const Text("Solo productos disponibles"),
                    value: onlyAvailable,
                    onChanged:
                        (val) =>
                            setModalState(() => onlyAvailable = val ?? false),
                  ),

                  // Valoración mínima
                  const SizedBox(height: 10),
                  Text("Valoración mínima: ${minRating.toStringAsFixed(1)} ⭐"),
                  Slider(
                    value: minRating,
                    min: 0,
                    max: 5,
                    divisions: 10,
                    label: minRating.toStringAsFixed(1),
                    onChanged: (val) => setModalState(() => minRating = val),
                  ),

                  const SizedBox(height: 20),

                  // Botón aplicar
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Aplicar filtros"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de productos")),
      floatingActionButton: FloatingActionButton(
        onPressed: _openFilterModal,
        child: const Icon(Icons.filter_list),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filtros aplicados:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text("Categoría: ${selectedCategory ?? 'Todas'}"),
            Text("Precio: \$${minPrice.round()} - \$${maxPrice.round()}"),
            Text("Solo disponibles: $onlyAvailable"),
            Text("Valoración mínima: ${minRating.toStringAsFixed(1)} ⭐"),
          ],
        ),
      ),
    );
  }
}
