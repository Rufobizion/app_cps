import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'screens.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
        'https://www.ipn.mx/assets/files/sustentabilidad/img/logo/logo-cps-3.png',
      ),
      logoWidth: 180,
      title: Text(
        "CPS",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: Text("Cargando..."),
      navigator: HomeScreen(),
      durationInSeconds: 6,
    );
  }
}
