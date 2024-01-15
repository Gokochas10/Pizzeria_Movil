import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';


class CustomDish extends StatefulWidget {
  final Dish dish;
  final int quantity;
  const CustomDish({super.key, required this.dish, this.quantity = 0});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDishState createState() => _CustomDishState();
}

class _CustomDishState extends State<CustomDish> {
  int quantity = 0;
  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
    setQuantity(widget.dish.id, widget.quantity);
  }
  List<OrderdetailsSet> detalles2 = listDetalles();
  void setQuantity(int productId, int cantidad) {
    for (var det in detalles2) {
      if (det.product == productId) {
        det.quantity = cantidad;
   
        return;  // No es necesario seguir buscando
      }
    }
  } 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/${widget.dish.image}"),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dish.name,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.dish.store!,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  if(widget.dish.tipo == 1) Text(
                    "Pizzas",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  if(widget.dish.tipo == 2) Text(
                    "Spaghettis",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  if(widget.dish.tipo == 3) Text(
                    "Bebidas",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                      height: 8), // Espacio entre la descripción y el tiempo
                  Row(
                    children: [
                      const Icon(
                        FeatherIcons.clock,
                        color: Colors.red,
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${widget.dish.proximity} mins",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 8), // Espacio entre el tiempo y las estrellas
                  Row(
                    children: [
                      const Icon(
                        FeatherIcons.star,
                        color: Colors.red,
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${widget.dish.stars}",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 8), // Espacio entre la descripción y el contador
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 0) {
                          quantity--;
                  
                          setQuantity(widget.dish.id, quantity);
                         
                        }
                      });
                    },
                    icon: const Icon(FeatherIcons.minus, color: Colors.red, size: 15),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "$quantity",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity < 10){
                          quantity++;

                          setQuantity(widget.dish.id, quantity);

                        }
              
                      });
                    },
                    icon:
                        const Icon(FeatherIcons.plus, color: Colors.green, size: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
