import 'package:app_delivery_flutter/src/pages/client/products/list/client_products_list_page.dart';
import 'package:app_delivery_flutter/src/pages/commerce/orders/list/commerce_orders_list_page.dart';
import 'package:app_delivery_flutter/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:app_delivery_flutter/src/pages/login/login_page.dart';
import 'package:app_delivery_flutter/src/pages/register/register_page.dart';
import 'package:app_delivery_flutter/src/pages/roles/roles_page.dart';
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
        //ruta de roles
        'roles': (BuildContext context) => RolesPage(),
        //page de lista de productos
        'client/products/list': (BuildContext context) => ClientProductsListPage(),
        //page lista de órdenes commerce
        'commerce/orders/list': (BuildContext context) => CommerceOrdersListPage(),
        //página lista de órdenes delivery
        'delivery/orders/list': (BuildContext context) => DeliveryOrdersListPage()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: UtilsColors.primaryColor),
        //fontFamily: 'NimbusSans'
      ),
    );
  }
}
