import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/pages/store.dart';
import 'package:proyecto_restaurante/services/push_notification_service.dart';
import 'package:proyecto_restaurante/services/user_services.dart';
import 'package:proyecto_restaurante/widgets/custom_button.dart';

Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    final pushNotificationService = PushNotificationService();
    pushNotificationService.getToken();
    pushNotificationService.registerTokenRefresh();
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  }
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí puedes hacer tu petición POST con _username y _password
      print('Username: $_username');
      print('Password: $_password');
      if(await UserServices().postUserCredentials(_username, _password) == true){
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Store()),
        );
      }else{
        print("no vale");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Container(
                width: 350,
                height: 350,
                child: Image.asset("assets/images/logo2.png"),
              ),
            ),
            SizedBox(height: 35),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Usuario'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu usuario';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu contraseña';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  InkWell(
                    onTap: () {
                      _submitForm();
                    },
                    child: CustomButton(
                      color: const Color(0xFFFF4317),
                      iconVisible: false,
                      text: "Iniciar sesión ",
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
