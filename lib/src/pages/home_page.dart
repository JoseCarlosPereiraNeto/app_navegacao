import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    void logout() {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home", style: TextStyle(fontSize: 25)),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      backgroundColor: Colors.amber,
      body: Text(email),
    );
  }
}