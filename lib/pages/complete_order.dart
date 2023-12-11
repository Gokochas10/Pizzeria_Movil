import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:proyecto_restaurante/pages/store.dart';
import 'package:proyecto_restaurante/sections/store/dropdown.dart';
import 'package:proyecto_restaurante/services/user_services.dart';


class CompleteOrder extends StatelessWidget {
  const CompleteOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<OrderdetailsSet> detallesClone = [];
    void dropDishes() {
      List<OrderdetailsSet> detalles2 = [];
      for (var detalle in detalles) {
        if (detalle.quantity != 0) {
          detalles2.add(detalle);
        }
      }
      detallesClone = detalles2;
    }
  List<Dish> platos = ListOfDishes() as List<Dish>;
    void reload() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const Store(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Orden', style: GoogleFonts.inter(fontSize: 20.0)),
      ),
      body: Stack(
        children: [
          // Fondo con la imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_confirmar.jpg'),
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
                        
                    Dish dish =  platos
                        .firstWhere((dish) => dish.id == detalle.product) ;

                    return Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
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
                            const SizedBox(height: 8.0),
                            Text(
                              'Cantidad: ${detalle.quantity}',
                              style: GoogleFonts.inter(
                                fontSize: 14.0,
                              ),
                            ),
                            if (index == null)
                                Text('Mesa: No seleccionada')
                            else
                              Text('Mesa: ${index}'),
                            
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
                  onPressed: () async {
                    detallesClone = List.from(listDetalles());
                    dropDishes();
                    if (detallesClone.isEmpty) {
                      // ignore: use_build_context_synchronously
                      _mostrarSnackbar(context, 'No hay productos en la orden');
                      return;
                    }
                    if (index == null) {
                      // ignore: use_build_context_synchronously
                      _mostrarSnackbar(context, 'Seleccione una mesa');
                      return;
                    }
                    await UserServices().postOrders(index!, detallesClone);
                    //volver cero la cantidad de todos los productos originales
                    for (var detalle in listDetalles()) {
                      detalle.quantity = 0;
                    }
                    detallesClone = [];
                    // ignore: use_build_context_synchronously
                    _mostrarSnackbar(context, 'Datos enviados con éxito');
                    index = null;
                    reload();
                  },
                  icon:
                      const Icon(FeatherIcons.checkCircle, color: Colors.white),
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
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
