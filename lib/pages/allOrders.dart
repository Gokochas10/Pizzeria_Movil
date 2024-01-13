import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/pages/store.dart';

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
        .getOrdersAll(); // Asume que esta función devuelve la lista de pedidos
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
              return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmación'),
                        content:
                            Text('¿Quieres editar la orden de la mesa ${order['table']}?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Cierra el diálogo
                            },
                          ),
                          TextButton(
                            child: const Text('Sí'),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Store(
                                      orderDetails: orders[index]
                                          ['orderdetails_set']),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ListTile(
                  title: Text('MESA ${order['table']}',
                      style: const TextStyle(color: Colors.white)),
                ),
              );
            },
          ),
        ));
  }
}
