
import 'package:flutter/material.dart';

class Cargascreen extends StatelessWidget{
  const Cargascreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 24),
            Text('Cargando...', style: TextStyle(fontSize: 24),)
          ],
        ),
      ),
    );
  }

}