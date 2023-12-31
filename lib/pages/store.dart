import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/sections/store/custom_hero.dart';
import 'package:proyecto_restaurante/sections/store/dropdown.dart';
import 'package:proyecto_restaurante/sections/store/store_dishes.dart';
import 'package:proyecto_restaurante/pages/order.dart';
import 'package:proyecto_restaurante/services/push_notification_service.dart';

import '../sections/store/options.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Store extends StatefulWidget {
  const Store({super.key});

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

  @override
  Widget build(BuildContext context) {
    List<String> options1 = ["Cena", "Almuerzos", "Fideos", "Postre", "Pizza"];
    String dropdownValue = list.first;
    List<String> options2 = [
      "Carnes",
      "Filetes",
      "Hamburguesas",
      "Comida Rapida",
      "Otros"
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
                  builder: (context) => Order()), // Order() es la nueva página
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomHero(),
            SizedBox(height: 16),
            //Options(options: options1),
            SizedBox(height: 16),
            //Options(options: options2),
            MyWidget(),
            StoreDishes()
          ],
        ),
      ),
    );
  }
}
