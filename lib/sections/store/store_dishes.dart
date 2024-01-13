import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/widgets/custom_dish.dart';

class StoreDishes extends StatelessWidget {
  final List<dynamic> orderDetails;
  const StoreDishes({super.key, this.orderDetails  = const []});
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
        var orderDetail = orderDetails.firstWhere((detail) => detail['product'] == dishes[index].id && detail['detail_status'] == 'P', orElse: () => null);
        return CustomDish(dish: dishes[index], quantity: orderDetail != null ? orderDetail['quantity'] : 0);
      },
    );
  }
}
