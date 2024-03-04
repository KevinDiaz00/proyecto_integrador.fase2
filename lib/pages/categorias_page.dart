import 'package:flutter/material.dart';
import 'package:pdv4/controlador/categoria_controlador.dart';
import 'package:pdv4/controlador/producto_controlador.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final CategoriaControlador categoriaControlador = CategoriaControlador();
  final ProductoControlador productoControlador = ProductoControlador();
  final TextEditingController nombreControlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // categoriaControlador.vaciarCategorias();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Categorias"),
      ),
      body: categoriaControlador.categorias.isEmpty
          ? const Center(
              child: Text('No hay categorias'),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (var categoria in categoriaControlador.categorias)
                    ListTile(
                      // onTap: () {
                      //   Navigator.pushNamed(
                      //     context,
                      //     '/edit_page',
                      //     arguments: categoriaControlador.productosPorCategoria(
                      //       categoria,
                      //     ),
                      //   );
                      // },
                      title: Text(categoria),
                      trailing: Text(
                        'Productos: ${categoriaControlador.productosPorCategoria(categoria).length}',
                      ),
                    ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Agregar categoria'),
                content: TextField(
                  controller: nombreControlador,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      categoriaControlador
                          .agregarCategoria(nombreControlador.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              );
            },
          ).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
