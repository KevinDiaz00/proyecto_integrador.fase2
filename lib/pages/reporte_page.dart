import 'package:flutter/material.dart';
import 'package:pdv4/controlador/venta_controller.dart';

class ReportePage extends StatefulWidget {
  const ReportePage({super.key});

  @override
  State<ReportePage> createState() => _ReportePageState();
}

class _ReportePageState extends State<ReportePage> {
  VentaController ventaController = VentaController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Reporte"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ventaController.ventas.isEmpty
          ? const Center(
              child: Text(
                'No hay ventas',
                style: TextStyle(fontSize: 30),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          for (var venta in ventaController.ventas)
                            ListTile(
                              title: Text(
                                'Venta: ${venta.id}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                'Fecha: ${venta.fecha.split('.')[0]}',
                                style: const TextStyle(fontSize: 15),
                              ),
                              trailing: Text(
                                'Total: \$${venta.total}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Productos'),
                                      content: Column(
                                        children: <Widget>[
                                          for (var fila in venta.productos)
                                            ListTile(
                                              title: Text(
                                                fila.producto.nombre,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              subtitle: Text(
                                                'Cantidad: ${fila.cantidad}',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              trailing: Text(
                                                '\$${fila.subtotal}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
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
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
