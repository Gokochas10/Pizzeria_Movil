// CustomHero.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';
import 'package:proyecto_restaurante/pages/Login.dart';
import 'package:proyecto_restaurante/pages/complete_order.dart';
import 'package:proyecto_restaurante/sections/store/dropdown.dart';
// Importa la nueva página

class CustomHero extends StatelessWidget {
  const CustomHero({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_restaurante.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      for (var detalle in listDetalles()) {
                        detalle.quantity = 0;
                      }
                      index = null;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Login()),
                      );
                    },
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors
                                .white, // Cambia esto al color de fondo que desees
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              FeatherIcons.clipboard,
                              color: Colors.black,
                            ),
                            iconSize: 30.0,
                            onPressed: () {
                              // Navegar a la nueva página en blanco
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CompleteOrder(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "La Cigarra",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    /*const Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "4.6",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),*/
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Restaurante-Comida-Italiana",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
