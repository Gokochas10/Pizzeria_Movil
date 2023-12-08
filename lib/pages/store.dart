import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';
import 'package:proyecto_restaurante/sections/store/custom_hero.dart';
import 'package:proyecto_restaurante/sections/store/store_dishes.dart';
import 'package:proyecto_restaurante/services/user_services.dart';
import '../sections/store/options.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> quantityNotifier = ValueNotifier<int>(0);
    List<String> options1 = ["Cena", "Almuerzos", "Fideos", "Postre", "Pizza"];
    List<OrderdetailsSet> detallesClone = [];
    void dropDishes() {
      List<OrderdetailsSet> detalles2 = [];
      for (var detalle in detalles) {
        if (detalle.quantity != 0) {
          detalles2.add(detalle);
        }
      }
      detallesClone = detalles2;
    }

    void reload() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Store(),
        ),
      );
    }

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
          onPressed: () async {
            detallesClone = List.from(listDetalles());
            dropDishes();
            await UserServices().postMensajes('1', detallesClone);
            //volver cero la cantidad de todos los productos originales
            for (var detalle in listDetalles()) {
              detalle.quantity = 0;
            }
            detallesClone = [];
            reload();
          },
          backgroundColor: const Color(0xFFFF4317),
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
            const CustomHero(),
            const SizedBox(height: 16),
            Options(options: options1),
            const SizedBox(height: 16),
            Options(options: options2),
            const StoreDishes(),
          ],
        ),
      ),
    );
  }
}
