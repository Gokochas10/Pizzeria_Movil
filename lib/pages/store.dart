import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/sections/store/custom_hero.dart';
import 'package:proyecto_restaurante/sections/store/dropdown.dart';
import 'package:proyecto_restaurante/sections/store/options.dart';
import 'package:proyecto_restaurante/sections/store/store_dishes.dart';
import 'package:proyecto_restaurante/pages/order.dart';
import 'package:proyecto_restaurante/services/push_notification_service.dart';

class Store extends StatefulWidget {
  final dynamic order;
  const Store({super.key, this.order});
  
  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  
  @override
  void initState() {
    super.initState();
    final pushNotificationService = PushNotificationService();
    Future.delayed(Duration.zero, () {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          pushNotificationService.showOverlayNotification(context, message);
        }
      });
    });
  }
  List<Dish> allDishes = ListOfDishes();
  List<Dish> selectedDishes = ListOfDishes();
  Map<Dish, int> dishQuantities = {};
  void onMenuOptionSelected(int tipo) {
    print(tipo);
    setState(() {
      if (tipo <= 0) {
        // Si es "Todo", muestra todos los platos
        selectedDishes = List.of(allDishes);
      } else {
        // Filtra por el tipo seleccionado
        selectedDishes = allDishes.where((dish) => dish.tipo == tipo).toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    List<String> options2 = [
      "Todo",
      "Pizzas",
      "Spaghettis",
      "Bebidas"
    ];

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () {
            // Navegar a la nueva página al hacer clic en el botón
        
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Order()), // Order() es la nueva página
            );
          },
          backgroundColor: Colors.black,
          child: const Stack(
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: Icon(FeatherIcons.checkSquare, color: Colors.white),
              ),
              Positioned(
                top: 1,
                right: 1,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: Text("4", style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHero(order: widget.order ),
            const SizedBox(height: 16),
            Options(options: options2,
              onMenuOptionSelected: (int tipo) {
                onMenuOptionSelected(tipo);
              },
            ),
            
            const MyWidget(),
            StoreDishes(dishes: selectedDishes,orderDetails: widget.order != null ? widget.order['orderdetails_set'] : [])
          ],
        ),
      ),
    );
  }
}
