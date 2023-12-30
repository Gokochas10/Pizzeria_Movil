import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/sections/store/custom_hero.dart';
import 'package:proyecto_restaurante/sections/store/dropdown.dart';
import 'package:proyecto_restaurante/sections/store/store_dishes.dart';
import 'package:proyecto_restaurante/pages/order.dart';
import '../sections/store/options.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Store extends StatelessWidget {
  const Store({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHero(),
            const SizedBox(height: 16),
            Options(options: options1),
            const SizedBox(height: 16),
            Options(options: options2),
            const MyWidget(),
            const StoreDishes()
          ],
        ),
      ),
    );
  }
}
