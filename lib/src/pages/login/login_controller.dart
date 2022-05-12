import 'package:app_delivery_flutter/src/models/response_api.dart';
import 'package:app_delivery_flutter/src/provider/users_provider.dart';
import 'package:app_delivery_flutter/src/utils/utils_sharedpref.dart';
import 'package:app_delivery_flutter/src/utils/utils_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:app_delivery_flutter/src/models/user.dart';

class LoginController{
  //se agrega un ? indicando que puede ser nula la variable
  BuildContext context;

  //Controladores para detectar el texto escrito
  TextEditingController emailCtrller = new TextEditingController();
  TextEditingController pwCtrller = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  UtilsSharedpref _sharedpref = new UtilsSharedpref();

  //constructort de clase - puede requerir await si se necesita esperar algo
  Future init(BuildContext context) async{
    this.context = context;
    await usersProvider.init(context);
    //se lee si hay llave user, en await
    //si no hay nada se manda nulo
    User user = User.fromJson(await _sharedpref.read('user') ?? {});

    //Se agrega ? porque user puede ser nulo porque no hay información por parte del sahredpreference
    //el ? evita un null.sessiontoken != null
    if(user?.sessionToken != null){
      //verificar si tiene más de un rol el usuario para enviarle a la pantalla roles
      if(user.roles.length > 1){
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      }
      else{
        //pushNamedAndRemoveUntil -> quita historial de todas las pantallas y es la principal
        //se redirecciona a la ruta que tenga almacenada en la db si solo es una
        Navigator.pushNamedAndRemoveUntil(context, user.roles[0].route, (route) => false);
      }
    }
    
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
        //se verifica si el acceso es correcto
        if(responseApi.success){
          User user = User.fromJson(responseApi.data);
          _sharedpref.save('user', user.toJson());

          print('USER. ${user.toJson()}');

          //verificar si tiene más de un rol el usuario para enviarle a la pantalla roles
          if(user.roles.length > 1){
            Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
          }
          else{
            //pushNamedAndRemoveUntil -> quita historial de todas las pantallas y es la principal
            //se redirecciona a la ruta que tenga almacenada en la db si solo es una
            Navigator.pushNamedAndRemoveUntil(context, user.roles[0].route, (route) => false);
          }
        }
        else{
          UtilsSnackbar.show(context, responseApi.message);
        }
    }

  }

  //NULL SAFETY -> ninguna variable puede ser nulo
}