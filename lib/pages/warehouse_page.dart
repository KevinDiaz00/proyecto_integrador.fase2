import 'package:flutter/material.dart';
import 'package:pdv4/controlador/producto_controlador.dart';

class WareHousePage extends StatefulWidget {
  const WareHousePage({super.key});

  @override
  State<WareHousePage> createState() => _WareHousePageState();
}

class _WareHousePageState extends State<WareHousePage> {
  final ProductoControlador productoControlador = ProductoControlador();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Almacen"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: productoControlador.productos.isEmpty
          ? const Center(
              child: Text(
                'No hay productos',
                style: TextStyle(fontSize: 30),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  for (var producto in productoControlador.productos)
                    ListTile(
                      title: Text(
                        producto.nombre,
                        style: const TextStyle(fontSize: 20),
                      ),
                      leading: Text(
                        '\$${producto.precio}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        'Cantidad: ${producto.cantidad}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/edit_page',
                            arguments: producto,
                          ).then((value) {
                            setState(() {});
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
