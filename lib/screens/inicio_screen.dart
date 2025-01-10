import 'package:flutter/material.dart';
import '../widgets/dev_drawer.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio QR'),
      ),
      drawer: const DevDrawer(),
      body: const Center(
        child: Text('Pantalla de Inicio QR'),
      ),
    );
  }
} 
