import 'package:flutter/material.dart';
import 'package:pdv4/controlador/producto_controlador.dart';

class AltasPage extends StatefulWidget {
  const AltasPage({Key? key}) : super(key: key);

  @override
  State<AltasPage> createState() => _AltasPageState();
}

class _AltasPageState extends State<AltasPage> {
  final ProductoControlador productoControlador = ProductoControlador();

  final TextEditingController idControlador = TextEditingController();
  final TextEditingController nombreControlador = TextEditingController();
  final TextEditingController precioControlador = TextEditingController();
  final TextEditingController categoriaControlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Altas"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
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
              child: TextField(
                controller: nombreControlador,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: precioControlador,
                decoration: const InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: categoriaControlador,
                decoration: const InputDecoration(
                  labelText: 'Categoria',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String salida = productoControlador.agregarProducto(
                  idControlador.text,
                  nombreControlador.text,
                  precioControlador.text.isEmpty
                      ? 0
                      : double.parse(precioControlador.text),
                  categoriaControlador.text,
                );
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Resultado"),
                      content: Text(salida),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "OK",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                "Agregar",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
