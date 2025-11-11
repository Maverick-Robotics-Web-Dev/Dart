class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory;
  bool onlyFavorites = false;

  void _openFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Filtros",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Filtro de categoría
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Categoría"),
                    value: selectedCategory,
                    items:
                        ["Comida", "Ropa", "Tecnología"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged: (val) {
                      setModalState(() => selectedCategory = val);
                    },
                  ),

                  // Checkbox
                  CheckboxListTile(
                    title: const Text("Solo favoritos"),
                    value: onlyFavorites,
                    onChanged: (val) {
                      setModalState(() => onlyFavorites = val ?? false);
                    },
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(
                        () {},
                      ); // Actualiza filtros en la pantalla principal
                    },
                    child: const Text("Aplicar filtros"),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejemplo de filtros")),
      body: Center(
        child: Text(
          "Categoría: ${selectedCategory ?? 'Ninguna'}\nSolo favoritos: $onlyFavorites",
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openFilterModal,
        child: const Icon(Icons.filter_list),
      ),
    );
  }
}

################################################################################

🧩 Código completo — Filtros persistentes con SharedPreferences

Primero, agrega la dependencia en tu pubspec.yaml:

dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.3.2  # o la última versión disponible

Luego, este es el código completo 👇

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filtro persistente',
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
  final List<Product> allProducts = [
    Product(name: "Smartphone", category: "Electrónica", price: 800, available: true, rating: 4.5),
    Product(name: "Laptop", category: "Electrónica", price: 1500, available: false, rating: 4.8),
    Product(name: "Camiseta", category: "Ropa", price: 25, available: true, rating: 4.0),
    Product(name: "Balón de fútbol", category: "Deportes", price: 40, available: true, rating: 3.9),
    Product(name: "Sofá", category: "Hogar", price: 600, available: true, rating: 4.2),
    Product(name: "Muñeca", category: "Juguetes", price: 35, available: false, rating: 4.7),
  ];

  // --- Filtros persistentes ---
  String? selectedCategory;
  double minPrice = 0;
  double maxPrice = 2000;
  bool onlyAvailable = false;
  double minRating = 0;

  @override
  void initState() {
    super.initState();
    _loadFilters(); // Cargar filtros guardados al iniciar
  }

  // --- Cargar filtros desde SharedPreferences ---
  Future<void> _loadFilters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCategory = prefs.getString('selectedCategory');
      minPrice = prefs.getDouble('minPrice') ?? 0;
      maxPrice = prefs.getDouble('maxPrice') ?? 2000;
      onlyAvailable = prefs.getBool('onlyAvailable') ?? false;
      minRating = prefs.getDouble('minRating') ?? 0;
    });
  }

  // --- Guardar filtros en SharedPreferences ---
  Future<void> _saveFilters() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCategory', selectedCategory ?? '');
    await prefs.setDouble('minPrice', minPrice);
    await prefs.setDouble('maxPrice', maxPrice);
    await prefs.setBool('onlyAvailable', onlyAvailable);
    await prefs.setDouble('minRating', minRating);
  }

  // --- Aplicar filtros a la lista ---
  List<Product> get filteredProducts {
    return allProducts.where((p) {
      final matchCategory =
          selectedCategory == null || selectedCategory == '' || p.category == selectedCategory;
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    // Categoría
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "Categoría"),
                      value: selectedCategory?.isEmpty ?? true ? null : selectedCategory,
                      items: [
                        "Electrónica",
                        "Ropa",
                        "Hogar",
                        "Deportes",
                        "Juguetes"
                      ]
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => setModalState(() {
                        selectedCategory = val;
                      }),
                    ),
                    const SizedBox(height: 20),

                    // Rango de precio
                    Text("Rango de precio: \$${minPrice.round()} - \$${maxPrice.round()}"),
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
                      onChanged: (val) => setModalState(() => onlyAvailable = val ?? false),
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
                      onPressed: () async {
                        await _saveFilters(); // Guardar los filtros
                        if (mounted) {
                          Navigator.pop(context);
                          setState(() {}); // Refrescar UI principal
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text("Aplicar y guardar filtros"),
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
        child: productos.isEmpty
            ? const Center(
                child: Text("No hay productos que coincidan con los filtros 😢"),
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
                      trailing: p.available
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.cancel, color: Colors.redAccent),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

####################################################################################

Dependencias necesarias

Agrega esto a tu pubspec.yaml:

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
  shared_preferences: ^2.3.2

Código completo — Filtros globales con Provider + persistencia

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final filterProvider = FilterProvider();
  await filterProvider.loadFilters(); // Cargar filtros antes de iniciar la app

  runApp(
    ChangeNotifierProvider(
      create: (_) => filterProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filtros Globales',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ProductPage(),
    );
  }
}

/// --- Provider que guarda y persiste los filtros ---
class FilterProvider extends ChangeNotifier {
  String? selectedCategory;
  double minPrice = 0;
  double maxPrice = 2000;
  bool onlyAvailable = false;
  double minRating = 0;

  /// Cargar filtros desde SharedPreferences
  Future<void> loadFilters() async {
    final prefs = await SharedPreferences.getInstance();
    selectedCategory = prefs.getString('selectedCategory');
    minPrice = prefs.getDouble('minPrice') ?? 0;
    maxPrice = prefs.getDouble('maxPrice') ?? 2000;
    onlyAvailable = prefs.getBool('onlyAvailable') ?? false;
    minRating = prefs.getDouble('minRating') ?? 0;
    notifyListeners();
  }

  /// Guardar filtros
  Future<void> saveFilters() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCategory', selectedCategory ?? '');
    await prefs.setDouble('minPrice', minPrice);
    await prefs.setDouble('maxPrice', maxPrice);
    await prefs.setBool('onlyAvailable', onlyAvailable);
    await prefs.setDouble('minRating', minRating);
  }

  /// Actualizar filtros (y guardar)
  Future<void> updateFilters({
    String? category,
    double? min,
    double? max,
    bool? available,
    double? rating,
  }) async {
    selectedCategory = category ?? selectedCategory;
    minPrice = min ?? minPrice;
    maxPrice = max ?? maxPrice;
    onlyAvailable = available ?? onlyAvailable;
    minRating = rating ?? minRating;
    await saveFilters();
    notifyListeners();
  }
}

/// --- Modelo de producto ---
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

/// --- Pantalla principal ---
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  final List<Product> allProducts = const [
    Product(name: "Smartphone", category: "Electrónica", price: 800, available: true, rating: 4.5),
    Product(name: "Laptop", category: "Electrónica", price: 1500, available: false, rating: 4.8),
    Product(name: "Camiseta", category: "Ropa", price: 25, available: true, rating: 4.0),
    Product(name: "Balón de fútbol", category: "Deportes", price: 40, available: true, rating: 3.9),
    Product(name: "Sofá", category: "Hogar", price: 600, available: true, rating: 4.2),
    Product(name: "Muñeca", category: "Juguetes", price: 35, available: false, rating: 4.7),
  ];

  @override
  Widget build(BuildContext context) {
    final filters = context.watch<FilterProvider>();

    // Aplicar filtros globales
    final productos = allProducts.where((p) {
      final matchCategory =
          filters.selectedCategory == null ||
          filters.selectedCategory == '' ||
          p.category == filters.selectedCategory;
      final matchPrice = p.price >= filters.minPrice && p.price <= filters.maxPrice;
      final matchAvailable = !filters.onlyAvailable || p.available;
      final matchRating = p.rating >= filters.minRating;
      return matchCategory && matchPrice && matchAvailable && matchRating;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de productos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => const FilterModal(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: productos.isEmpty
            ? const Center(child: Text("No hay productos que coincidan con los filtros 😢"))
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
                      trailing: p.available
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.cancel, color: Colors.redAccent),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

/// --- Modal de filtros global ---
class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late String? category;
  late double minPrice;
  late double maxPrice;
  late bool onlyAvailable;
  late double minRating;

  @override
  void initState() {
    super.initState();
    final filters = context.read<FilterProvider>();
    category = filters.selectedCategory;
    minPrice = filters.minPrice;
    maxPrice = filters.maxPrice;
    onlyAvailable = filters.onlyAvailable;
    minRating = filters.minRating;
  }

  @override
  Widget build(BuildContext context) {
    final filters = context.read<FilterProvider>();

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
            const Text("Filtros globales",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Categoría
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Categoría"),
              value: category?.isEmpty ?? true ? null : category,
              items: [
                "Electrónica",
                "Ropa",
                "Hogar",
                "Deportes",
                "Juguetes"
              ]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => category = val),
            ),
            const SizedBox(height: 20),

            // Rango de precios
            Text("Precio: \$${minPrice.round()} - \$${maxPrice.round()}"),
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
                setState(() {
                  minPrice = values.start;
                  maxPrice = values.end;
                });
              },
            ),

            // Solo disponibles
            CheckboxListTile(
              title: const Text("Solo disponibles"),
              value: onlyAvailable,
              onChanged: (val) => setState(() => onlyAvailable = val ?? false),
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
              onChanged: (val) => setState(() => minRating = val),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () async {
                await filters.updateFilters(
                  category: category,
                  min: minPrice,
                  max: maxPrice,
                  available: onlyAvailable,
                  rating: minRating,
                );
                if (mounted) Navigator.pop(context);
              },
              icon: const Icon(Icons.save),
              label: const Text("Guardar filtros globales"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


