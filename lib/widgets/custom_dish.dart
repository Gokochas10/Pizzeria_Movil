import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:proyecto_restaurante/models/dish.dart';

class CustomDish extends StatefulWidget {
  final Dish dish;
  const CustomDish({Key? key, required this.dish});

  @override
  _CustomDishState createState() => _CustomDishState();
}

class _CustomDishState extends State<CustomDish> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
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
                  image: AssetImage("../assets/images/${widget.dish.image}"),
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
                    widget.dish.store,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                      height: 8), // Espacio entre la descripción y el tiempo
                  Row(
                    children: [
                      Icon(
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
                      Icon(
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
                        }
                      });
                    },
                    icon: Icon(FeatherIcons.minus, color: Colors.red, size: 15),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
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
                        quantity++;
                      });
                    },
                    icon:
                        Icon(FeatherIcons.plus, color: Colors.green, size: 15),
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
