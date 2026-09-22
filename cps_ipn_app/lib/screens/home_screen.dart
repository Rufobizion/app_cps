import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Center(
          child: Text(
            'Hola Mundo',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Cambia el color según el fondo de tu app
            ),
          ),
        ),
      ],
    );
  }
}
