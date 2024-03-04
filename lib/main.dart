import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:pdv4/pages/altas_page.dart';
import 'package:pdv4/pages/bajas_page.dart';
import 'package:pdv4/pages/categorias_page.dart';
import 'package:pdv4/pages/edit_page.dart';
import 'package:pdv4/pages/home_page.dart';
import 'package:pdv4/pages/reporte_page.dart';
import 'package:pdv4/pages/warehouse_page.dart';
import 'package:pdv4/themes/light_mode.dart';
import 'pages/intro_page.dart';

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox('productos');

  await Hive.openBox('categorias');

  await Hive.openBox('ventas');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/home_page': (context) => const HomePage(),
        '/warehouse_page': (context) => const WareHousePage(),
        '/altas_page': (context) => const AltasPage(),
        '/bajas_page': (context) => const BajasPage(),
        '/edit_page': (context) => const EditPage(),
        '/reporte_page': (context) => const ReportePage(),
        '/categorias_page': (context) => const CategoriasPage(),
      },
    );
  }
}
