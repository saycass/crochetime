import 'package:flutter/material.dart';

class InvalidRouteView extends StatelessWidget {
  const InvalidRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rota inválida'),
      ),
      body: const Center(
        child: Text(
          'Você não devia estar aqui :(',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
