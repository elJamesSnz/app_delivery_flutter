import 'package:flutter/material.dart';

class RegisterController{
  //se agrega un ? indicando que puede ser nula la variable
  BuildContext? context;
  TextEditingController emailCtrller = new TextEditingController();
  TextEditingController nameCtrller = new TextEditingController();
  TextEditingController lastnameCtrller = new TextEditingController();
  TextEditingController phoneCtrller = new TextEditingController();
  TextEditingController pwCtrller = new TextEditingController();
  TextEditingController confirmpwCtrller = new TextEditingController();


  Future? init(BuildContext context){
    this.context = context;
  }

  void register(){
    String email = emailCtrller.text.trim();
    String name = nameCtrller.text;
    String lastname = lastnameCtrller.text;
    String phone = phoneCtrller.text.trim();
    String pw = pwCtrller.text.trim();
    String cpw = confirmpwCtrller.text.trim();

    print('EMAIL $email');
    print('NAME $name');
    print('LNAME $lastname');
    print('PHONE $phone');
    print('PW $pw');
    print('CPW $cpw');
  }
}