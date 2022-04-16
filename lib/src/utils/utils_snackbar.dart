import 'package:flutter/material.dart';

class UtilsSnackbar{

  static void show(BuildContext context, String text){
    //se verifica que haya conetxto de la aplicación
    if(context == null) return;

    FocusScope.of(context).requestFocus(new FocusNode());
    //se remueve cualquier snackbar anterior o que se esté mostrando
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //se establece un snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
      content:
        //Se establece el texto como text quee se recive
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14
          ),
        ),
        //fondo del snackbar negro y duración 3s
        backgroundColor: Colors.black,
        duration: Duration(seconds: 3),
      )
    );

  }

}