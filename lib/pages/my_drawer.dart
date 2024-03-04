import 'package:flutter/material.dart';
import 'package:pdv4/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.local_grocery_store,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(height: 25),
          MyListTile(
            text: "Home",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyListTile(
            text: "Altas",
            icon: Icons.add,
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/altas_page');
            },
          ),
          MyListTile(
            text: "Bajas",
            icon: Icons.delete,
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/bajas_page');
            },
          ),
          MyListTile(
            text: "Categorias",
            icon: Icons.category,
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/categorias_page');
            },
          ),
          MyListTile(
            text: "Almacen",
            icon: Icons.warehouse,
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/warehouse_page');
            },
          ),
          MyListTile(
            text: "Reporte de ventas",
            icon: Icons.receipt_long,
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/reporte_page');
            },
          ),
          MyListTile(
            text: "Salir",
            icon: Icons.exit_to_app,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/intro_page', (route) => false),
          ),
        ],
      ),
    );
  }
}
