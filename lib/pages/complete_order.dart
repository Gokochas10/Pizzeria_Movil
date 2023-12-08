import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';

class CompleteOrder extends StatelessWidget {
  const CompleteOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Orden', style: GoogleFonts.inter(fontSize: 20.0)),
      ),
      body: Stack(
        children: [
          // Fondo con la imagen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('../assets/images/bg_confirmar.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Confirmar Orden',
                  style: GoogleFonts.inter(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView(
                  children: detalles
                      .where((detalle) => detalle.quantity != 0)
                      .map((detalle) {
                    Dish dish = ListOfDishes()
                        .firstWhere((dish) => dish.id == detalle.product);

                    return Card(
                      elevation: 5.0,
                      margin:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Producto: ${dish.name}',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Cantidad: ${detalle.quantity}',
                              style: GoogleFonts.inter(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _mostrarSnackbar(context, 'Datos enviados con éxito');
                  },
                  icon: Icon(FeatherIcons.checkCircle, color: Colors.white),
                  label: Text(
                    'Confirmar Orden',
                    style: GoogleFonts.inter(fontSize: 18.0)
                        .copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF4317),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _mostrarSnackbar(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
