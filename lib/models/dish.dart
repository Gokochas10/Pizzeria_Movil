import 'package:proyecto_restaurante/services/user_services.dart';

class Dish {
  int id;
  String name;
  String? store;
  int? proximity;
  String? image;
  double? stars;
  String price;

  Dish({
    required this.id,
    required this.name,
    this.store,
    this.proximity,
    this.image,
    this.stars,
    required this.price,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      price: json['sale_price'],
    );
  }
}
List<dynamic>? dishes;
Future<List<dynamic>?> listOfDishes() async {
  dishes = await UserServices().getDishes();
  return dishes;
  }
void leerlista() async {
  dishes = await listOfDishes();
  
}
// ignore: non_constant_identifier_names
List<Dish> ListOfDishes()  {
  leerlista();
  List<Dish>? dishesclone = dishes?.map((dynamic item) => Dish.fromJson(item)).toList();
  List<Dish> dishes2return = [];
  int i = 1;
  for (var element in dishesclone!) {
    Dish dish = Dish(
        id: element.id,
        name: element.name,
        store: "La Cigarra",
        proximity: 30,
        image: "dish$i.jpg",
        stars: 4.6,
        price: element.price
        );
    dishes2return.add(dish);
    i++;
  }
  return
  dishes2return;
    
}
