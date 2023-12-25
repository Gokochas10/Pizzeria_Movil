
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PushNotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<String?> getToken() async {
    String? fcmToken = await _messaging.getToken();
    if (fcmToken != null) {
      // Aquí podrías llamar a updateTokenOnServer si quieres actualizar el token inmediatamente después de obtenerlo
      print('Token: $fcmToken');
    }
    return fcmToken;
  }

  void registerTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen(updateTokenOnServer);
  }

  Future<void> updateTokenOnServer(String token) async {
    // Reemplaza con la URL de tu backend y añade cualquier cabecera adicional que necesites
    final Uri url = Uri.parse('http://10.0.2.2:8000/main/update/device');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // Si necesitas pasar un token de autenticación, añádelo aquí
      },
      body: jsonEncode(<String, String>{
        'new_token': token,
        // 'user_id': 'tu_user_id', // Asegúrate de pasar el user_id si tu backend lo necesita
      }),
    );

    if (response.statusCode == 200) {
      print('Token updated on server');
    } else {
      print('Failed to update token on server: ${response.body}');
    }
  }
}