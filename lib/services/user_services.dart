import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_restaurante/models/dish.dart';
import 'package:proyecto_restaurante/models/ordenes.dart';

class UserServices {
  getDishes() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/main/list/products');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        // ignore: unnecessary_null_comparison
        //List<Dish> dishes = body.map((dynamic item) => Dish.fromJson(item)).toList();
        //print(dishes.runtimeType);
        return body;
      } else {
        return <Dish>[];
      }
    } catch (e) {
      print("no vale");
      return <Dish>[];
    }
  }

  getTables() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/main/list/tables');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<dynamic> availableTables =
            body.where((table) => table['available'] == true).toList();
        return availableTables;
      } else {
        return <dynamic>[];
      }
    } catch (e) {
      print("no vale");
      return <dynamic>[];
    }
  }

  postOrders(String idmesa, List<OrderdetailsSet> detalles) async {
    try {
      Map<String, dynamic> jsonData = {
        "table": idmesa,
        "orderdetails_set":
            detalles.map((detalle) => detalle.toJson()).toList(),
      };

      // Convertir el objeto JSON a una cadena JSON
      String jsonBody = jsonEncode(jsonData);
      var url = Uri.parse('http://10.0.2.2:8000/api/orders/');

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: jsonBody);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  postUserCredentials(String user, String password) async {
    try {
      Map<String, dynamic> jsonData = {
        "username": user,
        "password": password,
      };
      print(jsonData);
      // Convertir el objeto JSON a una cadena JSON
      String jsonBody = jsonEncode(jsonData);
      var url = Uri.parse('http://10.0.2.2:8000/api/token/');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: jsonBody);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        print('a');
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  getOrders() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/orders/');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<dynamic> detailsReady = body
            .where((order) => order['orderdetails_set']
                .any((detail) => detail['detail_status'] == 'L'))
            .toList();
        return detailsReady;
      } else {
        return <dynamic>[];
      }
    } catch (e) {
      print("no vale");
      return <dynamic>[];
    }
  }

  String? extractCsrfToken(String html) {
    var match =
        RegExp(r'name="csrfmiddlewaretoken" value="([^"]+)"').firstMatch(html);
    return match?.group(1);
  }

  changeStatus(String id) async {
    try {
      // Convertir el objeto JSON a una cadena JSON

      var url = Uri.parse('http://10.0.2.2:8000/api/orders/update/$id/');
      var getResponse = await http.get(url);

      var csrfToken = extractCsrfToken(getResponse.body);

      var cookies = getResponse.headers['set-cookie'];
      if (csrfToken == null || cookies == null) {
        throw Exception('No se pudo obtener el token CSRF o las cookies');
      }

      // Configura las cabeceras para incluir las cookies y el token CSRF
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'cookie': cookies,
        'X-CSRFToken': csrfToken,
        // Añade aquí cualquier otro encabezado que necesites
      };

      final body = {
        'detail_status': 'E',
        // Añade aquí otros campos del formulario si los necesitas
      };

      // Enviamos la petición POST y no nos preocupamos por la respuesta
      http.post(url, headers: headers, body: body);
      // Si necesitas hacer algo con la respuesta, como un log, puedes hacerlo aquí
      print('La petición se envió, no nos importa la respuesta');
    } catch (e) {
      return false;
    }
  }

  getOrdersAll() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/orders/');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<dynamic> ordersReady =
            body.where((order) => order['order_status'] != 'C').toList();
        return ordersReady;
      } else {
        return <dynamic>[];
      }
    } catch (e) {
      print("no vale");
      return <dynamic>[];
    }
  }
}
