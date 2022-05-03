import 'package:app_delivery_flutter/src/utils/utils_sharedpref.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientProductsListController{
  BuildContext context;
  UtilsSharedpref _sharedPref = new UtilsSharedpref();

  //se hace un buildconetxt y le pasamos el contexto de la aplicación
  Future init(BuildContext context){
    this.context = context;
  }

  void logout(){
    //se envía la petición de logput con el contexto de la app
    _sharedPref.logout(context);
  }
}