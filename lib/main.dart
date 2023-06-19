import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginpage/screen/login_signup.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(
      AuthController())); //precisamos inicializar o firebase, também contamos como injecao de dependencias, 1 depende do outro pra acontecer
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'APP MODELO',
      debugShowCheckedModeBanner: false,
      home: LoginSignupScreen(),
    );
  }
}
