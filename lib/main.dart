import 'package:app_delivery_flutter/src/pages/client/products/list/client_products_list_page.dart';
import 'package:app_delivery_flutter/src/pages/login/login_page.dart';
import 'package:app_delivery_flutter/src/pages/register/register_page.dart';
import 'package:app_delivery_flutter/src/utils/utils_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

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
        'register': (BuildContext context) => RegisterPage(),
        //page de lista de productos
        'client/products/list': (BuildContext context) => ClientProductsListPage()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: UtilsColors.primaryColor),
        //fontFamily: 'NimbusSans'
      ),
    );
  }
}
