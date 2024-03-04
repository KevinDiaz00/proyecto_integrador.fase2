import 'package:flutter/material.dart';
import 'package:pdv4/controlador/producto_controlador.dart';
import 'package:pdv4/controlador/venta_controller.dart';
import 'package:pdv4/model/Venta.dart';

import 'package:pdv4/pages/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductoControlador productoControlador = ProductoControlador();
  final VentaController ventaController = VentaController();
  final TextEditingController idControlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Grosery Shop"),
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: idControlador,
              decoration: const InputDecoration(
                labelText: 'Buscar por ID',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                ventaController.agregarProducto(value, 1);
                setState(() {});
              },
            ),
            const SizedBox(height: 10),
            const Text('Presiona enter para agregar producto',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 10),
            Expanded(
              child: ventaController.productos.isEmpty
                  ? const Center(
                      child: Text(
                        'Aun no has agregado productos a tu carrito de compras',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          for (var fila in ventaController.productos)
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(
                                  fila.producto.nombre,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                leading: Text(
                                  '\$${fila.subtotal}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                subtitle: Text(
                                  'Cantidad: ${fila.cantidad}\nStock: ${fila.producto.cantidad}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        ventaController.agregarProducto(
                                            fila.producto.id, -1);
                                        setState(() {});
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        ventaController.agregarProducto(
                                            fila.producto.id, 1);
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Venta venta = ventaController.crearVenta();
                        ventaController.guardarVenta(venta);
                        ventaController.productos.clear();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Venta"),
                              content: Text(
                                  'Venta realizada por un total de \$${venta.total}'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                        setState(() {});
                      },
                      child: const Text(
                        'Vender',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
