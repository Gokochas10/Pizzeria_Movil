import 'package:flutter/material.dart';

import 'package:proyecto_restaurante/services/user_services.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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

  void changeStatus(String id) async {
    await UserServices().changeStatus(id);
    loadOrders(); // Recarga los pedidos después de cambiar el estado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ordenes Listas',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg_principal.png'), // Reemplaza con la ruta de tu imagen
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            var order = orders[index];
            var details = order['orderdetails_set']
                .where((detail) => detail['detail_status'] == 'L')
                .toList();

            return ExpansionTile(
              title: Text('MESA ${order['table']}',
                  style: const TextStyle(color: Colors.white)),
              children: details.map<Widget>((detail) {
                return ListTile(
                  title: Text(detail['product_name'],
                      style: const TextStyle(color: Colors.white)),
                  trailing: Text('CANTIDAD: ${detail['quantity']}', style: const TextStyle(color: Colors.white)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirmación'),
                          content: const Text(
                              '¿Estás seguro de despachar el plato?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Cierra el diálogo
                              },
                            ),
                            TextButton(
                              child: const Text('Sí'),
                              onPressed: () {
                                changeStatus(detail['id']
                                    .toString()); // Cambia el estado
                                Navigator.of(context)
                                    .pop(); // Cierra el diálogo
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
