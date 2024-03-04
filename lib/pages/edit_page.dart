import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdv4/controlador/producto_controlador.dart';
import 'package:pdv4/model/Producto.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final ProductoControlador productoControlador = ProductoControlador();

  final TextEditingController idControlador = TextEditingController();
  final TextEditingController nombreControlador = TextEditingController();
  final TextEditingController precioControlador = TextEditingController();
  final TextEditingController categoriaControlador = TextEditingController();
  final TextEditingController cantidadControlador = TextEditingController();

  bool inicializado = true;

  @override
  Widget build(BuildContext context) {
    final producto = ModalRoute.of(context)?.settings.arguments as Producto;
    if (inicializado) {
      idControlador.text = producto.id.toString();
      nombreControlador.text = producto.nombre;
      precioControlador.text = producto.precio.toString();
      categoriaControlador.text = producto.categoria;
      cantidadControlador.text = producto.cantidad.toString();
      inicializado = false;
    }

    print(producto.nombre);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Editar"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        String cant = (int.parse(cantidadControlador.text) - 1)
                            .toString();
                        if (int.parse(cant) >= 0) {
                          cantidadControlador.text = cant;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove)),
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    controller: cantidadControlador,
                    decoration: const InputDecoration(
                      labelText: 'Cantidad',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {
                      setState(() {
                        cantidadControlador.text =
                            (int.parse(cantidadControlador.text) + 1)
                                .toString();
                      });
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                String resultado = productoControlador.editarProducto(
                  idControlador.text,
                  nombreControlador.text,
                  double.parse(precioControlador.text),
                  categoriaControlador.text,
                  int.parse(cantidadControlador.text),
                );

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Resultado"),
                      content: Text(resultado),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    );
                  },
                ).then((value) {
                  Navigator.pop(context);
                });
              },
              child: const Text(
                "Editar",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
