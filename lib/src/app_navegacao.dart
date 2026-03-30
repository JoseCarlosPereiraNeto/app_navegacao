import 'package:app_navegacao/src/pages/home_page.dart';
import 'package:app_navegacao/src/pages/login_page.dart';
import 'package:app_navegacao/src/pages/cadastro_page.dart';
import 'package:flutter/material.dart';

class AppNavegacao extends StatelessWidget {
  const AppNavegacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App Navegação",
      routes: {
        "/": (_) => LoginPage(),
        "/cadastro": (_) => CadastroPage(),
        "/home":(_) => HomePage(),
      },
    );
  }
}