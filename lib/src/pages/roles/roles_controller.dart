import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:app_delivery_flutter/src/utils/utils_sharedpref.dart';
import 'package:flutter/material.dart';

class RolesController{
  BuildContext context;
  Function refresh;

  User user;
  UtilsSharedpref sharedPref = new UtilsSharedpref();

  Future init(BuildContext context, Function refresh) async{
    this.context = context;
    this.refresh = refresh;
    //se le el usuario que viene de sesión. Se usa await porque es un Future.
    user = User.fromJson(await sharedPref.read('user'));
    refresh();
  }


  void goToPage(String route){
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}