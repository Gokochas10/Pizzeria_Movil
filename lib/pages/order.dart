import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg_principal.png'), // Reemplaza con la ruta de tu imagen
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Ordenes',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white, // Color del texto
              fontWeight: FontWeight
                  .bold, // Puedes ajustar el peso de la fuente según tus preferencias
            ),
          ),
        ),
      ),
    );
  }
}
