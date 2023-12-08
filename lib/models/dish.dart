class Dish {
  int id;
  String name;
  String store;
  int proximity;
  String image;
  double stars;
  int price;

  Dish({
    required this.id,
    required this.name,
    required this.store,
    required this.proximity,
    required this.image,
    required this.stars,
    required this.price,
  });
}

List<Dish> ListOfDishes() {
  return [
    Dish(
        id: 1,
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        proximity: 30,
        image: "dish1.jpg",
        stars: 4.6,
        price: 25),
    Dish(
        id: 2,
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        proximity: 30,
        image: "dish2.jpg",
        stars: 4.6,
        price: 25),
    Dish(
        id: 3,
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        proximity: 30,
        image: "dish3.jpg",
        stars: 4.6,
        price: 25),
    Dish(
        id: 4,
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        proximity: 30,
        image: "dish4.jpg",
        stars: 4.6,
        price: 25),
  ];
}
