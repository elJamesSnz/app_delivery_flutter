import 'package:app_delivery_flutter/src/login/login_page.dart';
import 'package:app_delivery_flutter/src/register/register_page.dart';
import 'package:app_delivery_flutter/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      //ocultar bandera de debug
      debugShowCheckedModeBanner: false,
      //ruta  inicial, puede ser home o login, etc.
      initialRoute: 'login',
      //routes para mapear dónde están las pages
      routes: {
        //page de login
        'login': (BuildContext context) => LoginPage(),
        //page de registro
        'register': (BuildContext context) => RegisterPage()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: MyColors.primaryColor),
        //fontFamily: 'NimbusSans'
      ),
    );
  }
}
