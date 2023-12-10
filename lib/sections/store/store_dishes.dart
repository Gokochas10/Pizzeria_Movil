import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/widgets/custom_dish.dart';

class StoreDishes extends StatelessWidget {
  const StoreDishes({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Dish> dishes = ListOfDishes();
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 340,
        crossAxisCount: 2,
        mainAxisSpacing: 23,
        crossAxisSpacing: 24,
      ),
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        return CustomDish(dish: dishes[index]);
      },
    );
  }
}
