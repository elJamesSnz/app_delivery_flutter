import 'package:flutter/material.dart';

class LoginController{
  //se agrega un ? indicando que puede ser nula la variable
  BuildContext context;

  //Controladores para detectar el texto escrito
  TextEditingController emailCtrller = new TextEditingController();
  TextEditingController pwCtrller = new TextEditingController();


  //constructort de clase
  Future init(BuildContext context){
    this.context = context;
  }

  //método para hacer cambio de page a través de un controlador
  void goToRegisterPage(){
    Navigator.pushNamed(context, 'register');
  }

  void login(){
    //trim para eliminar espacios en blanco
    String email = emailCtrller.text.trim();
    String pw = pwCtrller.text.trim();
    //debug de variables
    print('Email:  $email');
    print('PW:  $pw');
  }

  //NULL SAFETY -> ninguna variable puede ser nulo
}