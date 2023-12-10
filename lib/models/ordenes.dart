import 'dart:convert';

List<Ordenes> ordenesFromJson(String str) => List<Ordenes>.from(json.decode(str).map((x) => Ordenes.fromJson(x)));

String ordenesToJson(List<Ordenes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ordenes {
    int table;
    List<OrderdetailsSet> orderdetailsSet;

    Ordenes({
        required this.table,
        required this.orderdetailsSet,
    });

    factory Ordenes.fromJson(Map<String, dynamic> json) => Ordenes(
        table: json["table"],
        orderdetailsSet: List<OrderdetailsSet>.from(json["orderdetails_set"].map((x) => OrderdetailsSet.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "table": table,
        "orderdetails_set": List<dynamic>.from(orderdetailsSet.map((x) => x.toJson())),
    };
}

class OrderdetailsSet {
    int product;
    int quantity;

    OrderdetailsSet({
        required this.product,
        required this.quantity,
    });

    factory OrderdetailsSet.fromJson(Map<String, dynamic> json) => OrderdetailsSet(
        product: json["product"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
    };
}
List<OrderdetailsSet> detalles = [
  OrderdetailsSet(product: 1, quantity: 0),
  OrderdetailsSet(product: 2, quantity: 0),
  OrderdetailsSet(product: 3, quantity: 0),
  OrderdetailsSet(product: 4, quantity: 0),
  OrderdetailsSet(product: 5, quantity: 0),
  OrderdetailsSet(product: 6, quantity: 0),
  OrderdetailsSet(product: 7, quantity: 0),
  OrderdetailsSet(product: 8, quantity: 0)
];

List<OrderdetailsSet> listDetalles(){
  return detalles;
} 