import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/pages/store.dart';
import 'package:proyecto_restaurante/services/user_services.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

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
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            var order = orders[index];
            var details = order['orderdetails_set']
                .where((detail) => detail['detail_status'] == 'L')
                .toList();

            return ExpansionTile(
              title: Text('Table ${order['table']}'),
              children: details.map<Widget>((detail) {
                return ListTile(
                  title: Text(detail['product_name']),
                  trailing: Text('Quantity: ${detail['quantity']}'),
                  onTap: () {
                    changeStatus(detail['id'].toString());
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
