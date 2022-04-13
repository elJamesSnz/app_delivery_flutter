import 'package:app_delivery_flutter/src/models/response_api.dart';
import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:app_delivery_flutter/src/provider/users_provider.dart';
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
    
    User user = new User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: pw,
    );

    //esperar respuesta del servidor al mandar la petición de crear un usuario
    ResponseApi responseApi = await usersProvider.create(user);

    print('RESPUESTA ${responseApi?.toJson()}');

    print('EMAIL $email');
    print('NAME $name');
    print('LNAME $lastname');
    print('PHONE $phone');
    print('PW $pw');
    print('CPW $cpw');
  }
}