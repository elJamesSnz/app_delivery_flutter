import 'package:flutter/material.dart';

class LoginController{
  //se agrega un ? indicando que puede ser nula la variable
  BuildContext? context;

  //constructort de clase
  Future? init(BuildContext context){
    this.context = context;
  }

  //método para hacer cambio de page a través de un controlador
  void goToRegisterPage(){
    Navigator.pushNamed(context!, 'register');
  }

  //NULL SAFETY -> ninguna variable puede ser nulo
}