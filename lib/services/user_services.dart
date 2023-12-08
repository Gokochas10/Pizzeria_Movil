import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_restaurante/models/ordenes.dart';

class UserServices {
  getMensajes() async {
    try{
      var url = Uri.parse('http://10.0.2.2:8000/api/orders/');
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<dynamic> dynamicList = jsonDecode(response.body);
        List<Ordenes> body = dynamicList.map((item) => Ordenes.fromJson(item)).toList();
        print(body.runtimeType);
        return body;
      }else{
        return null;
      }
    }catch(e){
     
      return null;
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
