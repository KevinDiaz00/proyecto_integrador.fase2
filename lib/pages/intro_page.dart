import 'package:flutter/material.dart';
import 'package:pdv4/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 40, top: 160),
            child: Image.asset('lib/imagenes/carrito2.png'),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "Bienvenido Comprador",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily:
                    'Montserrat', // Aquí se establece la fuente Montserrat
              ),
            ),
          ),
          const Text(
            "Surte tu despensa aquí",
            style: TextStyle(
              fontFamily:
                  'Montserrat', // Aquí se establece la fuente Montserrat
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            )),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(23),
              child: const Text(
                "Empezar",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily:
                      'Montserrat', // Aquí se establece la fuente Montserrat
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
