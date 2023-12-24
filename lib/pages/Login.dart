import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/pages/store.dart';
import 'package:proyecto_restaurante/services/push_notification_service.dart';
import 'package:proyecto_restaurante/widgets/custom_button.dart';

class Login extends StatefulWidget {
   const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PushNotificationService pushNotificationService = PushNotificationService();

  @override
  void initState() {
    super.initState();
    pushNotificationService.getToken().then((value){
      print("Token: $value");
    });
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Store()),
                );
              },
              child: CustomButton(
                color: const Color(0xFFFF4317),
                iconVisible: false,
                text: "Iniciar sesión con Google",
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Store()),
                );
              },
              child: CustomButton(
                color: Colors.amber,
                iconVisible: false,
                text: "Iniciar sesión",
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                text: '¿Ya tienes una cuenta? ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Iniciar sesión',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
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
