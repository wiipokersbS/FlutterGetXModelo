import 'package:flutter/material.dart';
import 'package:flutterloginpage/auth_controller.dart';
import 'package:flutterloginpage/screen/webview_page.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double customWidth = MediaQuery.of(context).size.width;
    double customHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3b5999).withOpacity(.85),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.fill)),
              accountName: const Text('Olá '),
              accountEmail: Text(email),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white70,
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile1.png"),
              ),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Get.to(WelcomePage(email: email));
              },
            ),
            ListTile(
              title: const Text('Sobre o Carro'),
              onTap: () {
                Get.to(WebviewPage());
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                AuthController.authControllerInstance.logout();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: customWidth,
            height: customHeight * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                SizedBox(height: customHeight * 0.16),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile1.png"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Container(
            width: customWidth,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Olá!",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(WebviewPage());
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/vectors/car-icon-black-and-white-design-vector-illustration-vector-id993958088?k=6&m=993958088&s=170667a&w=0&h=aGzDpsteV9Y1sa7nZbMTCNyTxxQPJc9YVrTLfzHRSYA='),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          /*GestureDetector(
            onTap: () {
              AuthController.authControllerInstance.logout();
            },
            child: Container(
              width: customWidth * 0.8,
              height: customHeight * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage("assets/images/loginbtn.png"),
                    fit: BoxFit.cover),
              ),
              child: const Center(
                child: Text(
                  "Sair",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),*/
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: customWidth,
          ),
          /*RichText(
            text: const TextSpan(
              text: " Ou Entre",
              style: TextStyle(color: Colors.grey, fontSize: 19),
            ),
          ),*/
          /*Wrap(
            children: List<Widget>.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage("assets/images/" + images[index]),
                  ),
                ),
              );
            }),
          ),*/
        ],
      ),
    );
  }
}
