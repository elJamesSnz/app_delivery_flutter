import 'package:app_delivery_flutter/src/api/environment.dart';
import 'package:flutter/material.dart';

class UsersProvider{
  //URL del api
  String _url = Environment.API_DELIVERY;
  //para referenciar las API de usuarios
  String _api = '/api/users';

  BuildContext? context;

  Future? init(BuildContext context){
    this.context = context;
  }
}