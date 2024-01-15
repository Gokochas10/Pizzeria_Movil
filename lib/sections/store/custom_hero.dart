// CustomHero.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';
import 'package:proyecto_restaurante/pages/Login.dart';
import 'package:proyecto_restaurante/pages/allOrders.dart';
import 'package:proyecto_restaurante/pages/complete_order.dart';
import 'package:proyecto_restaurante/pages/store.dart';
// Importa la nueva página

class CustomHero extends StatelessWidget {
  final dynamic order;
  const CustomHero({super.key, this.order});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.43,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/principal.jpg"),
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmación'),
                            content: const Text(
                                '¿Estás seguro de que quieres volver al inicio de sesión?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Cierra el diálogo
                                },
                              ),
                              TextButton(
                                child: const Text('Limpiar orden'),
                                onPressed: () {
                                  for (var detalle in listDetalles()) {
                                    detalle.quantity = 0;
                                  }
                                  Navigator.of(context)
                                      .pop(); // Cierra el diálogo
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Store()), // Reemplaza con tu página StorePage
                                  );
                                },
                              ),
                              TextButton(
                                child: const Text('Sí'),
                                onPressed: () {
                                  for (var detalle in listDetalles()) {
                                    detalle.quantity = 0;
                                  }
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Login()),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(
                                FeatherIcons.clipboard,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (order == null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CompleteOrder(),
                                    ),
                                  );
                                }else{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CompleteOrder(order: order),
                                    ),
                                  );
                                  print(order);
                                }
                               
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.view_list,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Navegar a AllOrders
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AllOrders(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "La Cigarra",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "4.6",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Restaurante-Comida-Ecuatoriana-Vinos",
                      style: GoogleFonts.inter(
                        color: Colors.white,
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
