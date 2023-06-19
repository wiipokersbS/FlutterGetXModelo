import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginpage/screen/login_signup.dart';
import 'package:flutterloginpage/screen/welcome_page.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController authControllerInstance = Get.find(); //acesso global
  late Rx<User?> _user; // infos do usuário
  FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuthInstance.currentUser);
    _user.bindStream(firebaseAuthInstance
        .userChanges()); //bindStream notifica o _user que mudamos algo nas infos de usuário - vem do firebase
    ever(_user,
        _initialScreen); //a notificacao vem pelo app, ou seja, toda vez que algo for mudado no user, a func será notificada
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => LoginSignupScreen());
    } else {
      Get.offAll(() => WelcomePage(email: user.email!));
    }
  }

  Future<void> cadastrar(String email, password) async {
    try {
      await firebaseAuthInstance.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Cadastro não efetuado!",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  Future<void> login(String email, password) async {
    try {
      await firebaseAuthInstance.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login não efetuado!",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  Future<void> logout() async {
    await firebaseAuthInstance.signOut();
  }
}
