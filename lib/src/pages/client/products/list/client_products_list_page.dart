import 'package:app_delivery_flutter/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:app_delivery_flutter/src/utils/utils_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({Key key}) : super(key: key);

  @override
  _ClientProductsListPageState createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {

  ClientProductsListController _con = new ClientProductsListController();

  //se sobreescribe el método init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //se inicializa el controlador de cliet list products
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        //title: _showDrawer(),
        //leading para mostrar el nuestro y no el por defecto
        leading: _showDrawer(),
      ),
      drawer: _drawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: _con.logout,
          child: Text('Cerrar sesión'),
        ),
      ),
    );
  }

  Widget _showDrawer(){
    return GestureDetector(
      onTap: _con.openDrawer,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Image.asset('assets/img/menu.png', width: 20, height: 20,),
      ),
    );
  }

  Widget _drawer(){
    return Drawer(
      //Es una columna pero permite scroll
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            //agregar estilos
            decoration: BoxDecoration(
              color: UtilsColors.primaryColor,
            ),
              child: Column(
                children: [
                  Text('Nombre de usuario',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    //No puede abarcar más de una línea
                    maxLines: 1,
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
