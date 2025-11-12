import 'package:flutter/material.dart';

class VentanaFiltrosDinamicos extends StatefulWidget {
  const VentanaFiltrosDinamicos({Key? key}) : super(key: key);

  @override
  State<VentanaFiltrosDinamicos> createState() =>
      _VentanaFiltrosDinamicosState();
}

class _VentanaFiltrosDinamicosState extends State<VentanaFiltrosDinamicos> {
  String? categoriaSeleccionada;
  String? ordenSeleccionado;

  void _abrirFiltros() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => _FiltroBottomSheet(
            categoriaSeleccionada: categoriaSeleccionada,
            ordenSeleccionado: ordenSeleccionado,
            onAplicar: (categoria, orden) {
              setState(() {
                categoriaSeleccionada = categoria;
                ordenSeleccionado = orden;
              });
              Navigator.pop(context);
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de productos")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Categoría: ${categoriaSeleccionada ?? 'Ninguna'}"),
            Text("Ordenar: ${ordenSeleccionado ?? 'Por defecto'}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirFiltros,
        label: const Text("Filtros"),
        icon: const Icon(Icons.filter_list_rounded),
      ),
    );
  }
}

class _FiltroBottomSheet extends StatefulWidget {
  final String? categoriaSeleccionada;
  final String? ordenSeleccionado;
  final Function(String?, String?) onAplicar;

  const _FiltroBottomSheet({
    required this.categoriaSeleccionada,
    required this.ordenSeleccionado,
    required this.onAplicar,
  });

  @override
  State<_FiltroBottomSheet> createState() => _FiltroBottomSheetState();
}

class _FiltroBottomSheetState extends State<_FiltroBottomSheet> {
  String? categoria;
  String? orden;
  String tipoFiltro = "categoria"; // controla qué opciones se muestran

  final List<String> categorias = ["Tecnología", "Hogar", "Moda", "Deportes"];
  final List<String> ordenes = [
    "Precio ↑",
    "Precio ↓",
    "Más vendidos",
    "Nuevos",
  ];

  @override
  void initState() {
    super.initState();
    categoria = widget.categoriaSeleccionada;
    orden = widget.ordenSeleccionado;
  }

  @override
  Widget build(BuildContext context) {
    final opciones = tipoFiltro == "categoria" ? categorias : ordenes;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Botones superiores que cambian el contenido
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _botonFiltro("Categoría", tipoFiltro == "categoria", () {
                  setState(() => tipoFiltro = "categoria");
                }),
                _botonFiltro("Ordenar", tipoFiltro == "orden", () {
                  setState(() => tipoFiltro = "orden");
                }),
              ],
            ),
            const SizedBox(height: 20),

            // Contenido dinámico
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder:
                  (child, anim) => FadeTransition(opacity: anim, child: child),
              child: Wrap(
                key: ValueKey(tipoFiltro),
                spacing: 8,
                children:
                    opciones.map((opcion) {
                      final selected =
                          tipoFiltro == "categoria"
                              ? categoria == opcion
                              : orden == opcion;

                      return ChoiceChip(
                        label: Text(opcion),
                        selected: selected,
                        selectedColor: Colors.blue.shade100,
                        labelStyle: TextStyle(
                          color: selected ? Colors.blue.shade700 : Colors.black,
                        ),
                        onSelected: (_) {
                          setState(() {
                            if (tipoFiltro == "categoria") {
                              categoria = selected ? null : opcion;
                            } else {
                              orden = selected ? null : opcion;
                            }
                          });
                        },
                      );
                    }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // Botones inferiores
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      categoria = null;
                      orden = null;
                    });
                  },
                  child: const Text("Restablecer"),
                ),
                ElevatedButton.icon(
                  onPressed: () => widget.onAplicar(categoria, orden),
                  icon: const Icon(Icons.check),
                  label: const Text("Aplicar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _botonFiltro(String texto, bool activo, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: activo ? Colors.blue.shade600 : Colors.grey.shade300,
        foregroundColor: activo ? Colors.white : Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(texto),
    );
  }
}
