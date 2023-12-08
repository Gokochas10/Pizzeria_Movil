// BlankPage.dart
import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';

class CompleteOrder extends StatelessWidget {
  const CompleteOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page'),
      ),
      body: Center(
        child: Column(
        children: detalles.where((detalle) => detalle.quantity != 0).map((detalle) {
          // Encuentra el plato que tiene el mismo ID que el detalle
          Dish dish = ListOfDishes().firstWhere((dish) => dish.id == detalle.product);
          return Text('Producto: ${dish.name}, Cantidad: ${detalle.quantity}');
        }).toList(),
      ),
      ),
    );
  }
}
