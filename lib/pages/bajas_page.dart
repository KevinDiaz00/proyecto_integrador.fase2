import 'package:flutter/material.dart';
import 'package:pdv4/controlador/producto_controlador.dart';

class BajasPage extends StatefulWidget {
  const BajasPage({Key? key}) : super(key: key);

  @override
  State<BajasPage> createState() => _BajasPageState();
}

class _BajasPageState extends State<BajasPage> {
  final ProductoControlador productoControlador = ProductoControlador();
  final TextEditingController idControlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Bajas")),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: idControlador,
              decoration: const InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                String resultado =
                    productoControlador.eliminarProducto(idControlador.text);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(resultado),
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
                idControlador.clear();
              },
              child: const Text(
                'Eliminar',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
