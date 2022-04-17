import 'package:app_delivery_flutter/src/models/response_api.dart';
import 'package:app_delivery_flutter/src/provider/users_provider.dart';
import 'package:app_delivery_flutter/src/utils/utils_snackbar.dart';
import 'package:flutter/material.dart';

class LoginController{
  //se agrega un ? indicando que puede ser nula la variable
  BuildContext context;

  //Controladores para detectar el texto escrito
  TextEditingController emailCtrller = new TextEditingController();
  TextEditingController pwCtrller = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  //constructort de clase - puede requerir await si se necesita esperar algo
  Future init(BuildContext context) async{
    this.context = context;
    await usersProvider.init(context);
  }

  //método para hacer cambio de page a través de un controlador
  void goToRegisterPage(){
    Navigator.pushNamed(context, 'register');
  }

  void login() async{
    //trim para eliminar espacios en blanco
    String email = emailCtrller.text.trim();
    String pw = pwCtrller.text.trim();
    //debug de variables
    //print('Email:  $email');
    //print('PW:  $pw');
    ResponseApi responseApi = await usersProvider.login(email, pw);
    if(responseApi == null){
      UtilsSnackbar.show(context, "El correo no fue encontrado.");
    }
    else{
//      print("Respuesta: ${responseApi.toJson()}");
      UtilsSnackbar.show(context, responseApi.message);
    }

  }

  //NULL SAFETY -> ninguna variable puede ser nulo
}