import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';

class UserServices {
  getDishes() async {
    try{
      var url = Uri.parse('http://10.0.2.2:8000/main/list/products');
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);
        // ignore: unnecessary_null_comparison
        //List<Dish> dishes = body.map((dynamic item) => Dish.fromJson(item)).toList();
        //print(dishes.runtimeType);
        return body;
      }else{
        return <Dish>[];
      }
    }catch(e){
      print("no vale");
      return <Dish>[];
    }
  }
  postMensajes(String idmesa,List<OrderdetailsSet> detalles) async {
    try{
      Map<String, dynamic> jsonData = {
        "table": idmesa,
        "orderdetails_set": detalles.map((detalle) => detalle.toJson()).toList(),
      };

      // Convertir el objeto JSON a una cadena JSON
      String jsonBody = jsonEncode(jsonData);
      var url = Uri.parse('http://10.0.2.2:8000/api/orders/');
    
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonBody
      );
      if(response.statusCode == 200){
        
        return true;
        
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }
}
