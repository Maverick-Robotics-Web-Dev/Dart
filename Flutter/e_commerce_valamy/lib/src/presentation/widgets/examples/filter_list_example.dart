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

// Modelo simple de producto
class Product {
  final String name;
  final String category;
  final double price;
  final bool available;
  final double rating;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.available,
    required this.rating,
  });
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Lista de productos
  final List<Product> allProducts = [
    Product(
      name: "Smartphone",
      category: "Electrónica",
      price: 800,
      available: true,
      rating: 4.5,
    ),
    Product(
      name: "Laptop",
      category: "Electrónica",
      price: 1500,
      available: false,
      rating: 4.8,
    ),
    Product(
      name: "Camiseta",
      category: "Ropa",
      price: 25,
      available: true,
      rating: 4.0,
    ),
    Product(
      name: "Balón de fútbol",
      category: "Deportes",
      price: 40,
      available: true,
      rating: 3.9,
    ),
    Product(
      name: "Sofá",
      category: "Hogar",
      price: 600,
      available: true,
      rating: 4.2,
    ),
    Product(
      name: "Muñeca",
      category: "Juguetes",
      price: 35,
      available: false,
      rating: 4.7,
    ),
  ];

  // Filtros actuales
  String? selectedCategory;
  double minPrice = 0;
  double maxPrice = 2000;
  bool onlyAvailable = false;
  double minRating = 0;

  List<Product> get filteredProducts {
    return allProducts.where((p) {
      final matchCategory =
          selectedCategory == null || p.category == selectedCategory;
      final matchPrice = p.price >= minPrice && p.price <= maxPrice;
      final matchAvailable = !onlyAvailable || p.available;
      final matchRating = p.rating >= minRating;
      return matchCategory && matchPrice && matchAvailable && matchRating;
    }).toList();
  }

  // --- Modal de filtros ---
  void _openFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Filtros de productos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Categoría
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "Categoría"),
                      value: selectedCategory,
                      items:
                          [
                                "Electrónica",
                                "Ropa",
                                "Hogar",
                                "Deportes",
                                "Juguetes",
                              ]
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
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
                      title: const Text("Solo disponibles"),
                      value: onlyAvailable,
                      onChanged:
                          (val) =>
                              setModalState(() => onlyAvailable = val ?? false),
                    ),

                    // Valoración mínima
                    const SizedBox(height: 10),
                    Text(
                      "Valoración mínima: ${minRating.toStringAsFixed(1)} ⭐",
                    ),
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
                        setState(() {}); // Refresca los filtros aplicados
                      },
                      icon: const Icon(Icons.check),
                      label: const Text("Aplicar filtros"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // --- UI principal ---
  @override
  Widget build(BuildContext context) {
    final productos = filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de productos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _openFilterModal,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            productos.isEmpty
                ? const Center(
                  child: Text(
                    "No hay productos que coincidan con los filtros 😢",
                  ),
                )
                : ListView.builder(
                  itemCount: productos.length,
                  itemBuilder: (context, index) {
                    final p = productos[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(p.name[0])),
                        title: Text(p.name),
                        subtitle: Text(
                          "${p.category} • \$${p.price} • ⭐ ${p.rating.toStringAsFixed(1)}",
                        ),
                        trailing:
                            p.available
                                ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                                : const Icon(
                                  Icons.cancel,
                                  color: Colors.redAccent,
                                ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
