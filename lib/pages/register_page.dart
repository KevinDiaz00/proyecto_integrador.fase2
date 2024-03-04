import 'package:flutter/material.dart';

class RegistroForm extends StatefulWidget {
  const RegistroForm({Key? key}) : super(key: key);

  @override
  _RegistroFormState createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _idController,
            decoration: InputDecoration(labelText: 'ID'),
          ),
          TextFormField(
            controller: _nombreController,
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextFormField(
            controller: _precioController,
            decoration: InputDecoration(labelText: 'Precio'),
          ),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes realizar acciones como enviar los datos a una base de datos, etc.
              final id = _idController.text;
              final nombre = _nombreController.text;
              final precio = _precioController.text;
              print('ID: $id, Nombre: $nombre, Precio: $precio');
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
