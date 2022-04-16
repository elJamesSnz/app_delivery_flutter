import 'package:app_delivery_flutter/src/models/response_api.dart';
import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:app_delivery_flutter/src/provider/users_provider.dart';
import 'package:app_delivery_flutter/src/utils/utils_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterController{
  //se agrega un ? indicando que puede ser nula la variable
  BuildContext context;
  TextEditingController emailCtrller = new TextEditingController();
  TextEditingController nameCtrller = new TextEditingController();
  TextEditingController lastnameCtrller = new TextEditingController();
  TextEditingController phoneCtrller = new TextEditingController();
  TextEditingController pwCtrller = new TextEditingController();
  TextEditingController confirmpwCtrller = new TextEditingController();


  UsersProvider usersProvider = new UsersProvider();

  Future init(BuildContext context){
    this.context = context;
    usersProvider.init(context);
  }

  void register() async{
    String email = emailCtrller.text.trim();
    String name = nameCtrller.text;
    String lastname = lastnameCtrller.text;
    String phone = phoneCtrller.text.trim();
    String pw = pwCtrller.text.trim();
    String cpw = confirmpwCtrller.text.trim();

    //validar que no haya ningún campo vacío
    if(email.isEmpty || name.isEmpty || lastname.isEmpty || phone.isEmpty || pw.isEmpty || cpw.isEmpty){
      UtilsSnackbar.show(context, 'Debes ingresar todos los campos.');
      //se cancela ejecución
      return;
    }
    //validar contraseña
    if(pw != cpw){
      UtilsSnackbar.show(context, 'La contraseña y confirmación deben ser iguales.');
      //se cancela ejecución
      return;
    }


    //validar longitud de contraseña
    if(pw.length < 6){
      UtilsSnackbar.show(context, 'La contraseña debe tener al menos 6 caracteres.');
      //se cancela ejecución
      return;
    }

    User user = new User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: pw,
    );

    //esperar respuesta del servidor al mandar la petición de crear un usuario
    ResponseApi responseApi = await usersProvider.create(user);

    if(responseApi == null){
      UtilsSnackbar.show(context, "Error al crear el usuario\nSi el problema persiste, contacte a servicio.");
    }
    else{
      print('RESPUESTA ${responseApi?.toJson()}');
      UtilsSnackbar.show(context, responseApi.message);
    }


  }
}