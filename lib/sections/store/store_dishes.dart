import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/widgets/custom_dish.dart';

class StoreDishes extends StatefulWidget {
  final List<Dish> dishes;
  final List<dynamic> orderDetails;
  const StoreDishes({
    super.key,
    required this.dishes,
    this.orderDetails = const [],

  });

  @override
  State<StoreDishes> createState() => _StoreDishesState();
}

class _StoreDishesState extends State<StoreDishes> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 350,
        crossAxisCount: 2,
        mainAxisSpacing: 23,
        crossAxisSpacing: 24,
      ),
      itemCount: widget.dishes.length,
      itemBuilder: (context, index) {
        var orderDetail = widget.orderDetails.firstWhere((detail) => detail['product'] == widget.dishes[index].id && detail['detail_status'] == 'P', orElse: () => null);
        return CustomDish(dish: widget.dishes[index], quantity: orderDetail != null ? orderDetail['quantity'] : 0);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
