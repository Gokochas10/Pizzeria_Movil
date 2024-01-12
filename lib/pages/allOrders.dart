import 'package:flutter/material.dart';

import 'package:proyecto_restaurante/services/user_services.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  List<dynamic> orders = [];

  @override
  void initState() {
    super.initState();
    loadOrders(); // Llama a la función para cargar los pedidos cuando el estado se inicializa
  }

  void loadOrders() async {
    var fetchedOrders = await UserServices()
        .getOrders(); // Asume que esta función devuelve la lista de pedidos
    setState(() {
      orders = fetchedOrders;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar orden',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
      )
    );
  }
}