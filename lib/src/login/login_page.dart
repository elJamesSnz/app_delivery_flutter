import 'dart:ffi';

import 'package:app_delivery_flutter/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            //permite ubicar elemento donde se desee
            //negativo para que desaparezca
            Positioned(
              top: -80,
              left: -100,
              //Método para recuperar imagen circular
                child: _circleLogin()
            ),
            Positioned(
                child: _textLogin(),
                top: 60,
                left: 25,
            ),
            Column(
              children: [
                //método para invocar animación
                _LottieAnimLogin(),
                //Método para recuperar imagen
                //_imgLogin(),
                //Método para recuperar email
                _txtFEmail(),
                //Método para recuperar pw
                _txtFPW(),
                //Método para recuperar botón login
                _btnLogin(),
                //Método para recuperar register option
                _txtAcc()
              ],
            ),
          ],
        ),
      )
    );
  }


  //widget animación
  Widget _LottieAnimLogin(){
    return Container(
      //agregar margen
      margin: EdgeInsets.only(
        top: 150,
          bottom: MediaQuery.of(context).size.height * .17
      ),
      //se recupera asset
      child: Lottie.asset(
        'assets/json/delivery.json',
          width: 250,
          height: 200,
          fit: BoxFit.fill
      ),
    );
  }

  //Widget texto login
  Widget _textLogin(){
    //se retorna un texto
    return Text(
      'Login',
        //agregar estilos al texto
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'NimbusSans'
        ),
    );
  }
  //widget texto sin cuenta login
  Widget _txtAcc(){
    return Row(
      //centrar textos
      mainAxisAlignment: MainAxisAlignment.center,
      //hijos en horizontal
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(
              color: MyColors.primaryColor
          ),
        ),
        SizedBox(width: 7), //separación entre textos
        Text(
          'Regístrate',
          //agregar estilos
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor
          ),
        )
      ],
    );
  }
  //widget botón login
  Widget _btnLogin(){
    //para alargar un componente widget puede agruparse en un container
    return Container(
      //margen de la pantalla
      width: double.infinity,
      //agregar margen en los espacios horizontales y entre componentes
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(onPressed: (){},
          child: Text('Ingresar'),
          //estilos al botón
          style: ElevatedButton.styleFrom(
            //cambiar color al botón
            primary: MyColors.primaryColor,
            //modificar la forma del botón
            shape: RoundedRectangleBorder(
              //número de pixeles
              borderRadius: BorderRadius.circular(30)
            ),
            //agregar padding vertical / horizointal
            padding: EdgeInsets.symmetric(vertical: 15)
          ),
      ),
    );
  }
  //widget campo email
  Widget _txtFEmail(){
    return Container(
      //márgenes a los espacios horizontales
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      //agregar decoraciones al container como color, forma, etc
      decoration: BoxDecoration(
        //color del box
        color: MyColors.primaryOpacityColor,
        //radio del box
        borderRadius: BorderRadius.circular(30),


      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Correo electrónico',
            //quitamos línea inferior
            border: InputBorder.none,
            //agregamos espacio para que no esté pegado al borde
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }
  //widget campo password
  Widget _txtFPW(){
    return Container(
      //márgenes a los espacios horizontales
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      //agregar decoraciones al container como color, forma, etc
      decoration: BoxDecoration(
        //color del box
        color: MyColors.primaryOpacityColor,
        //radio del box
        borderRadius: BorderRadius.circular(30),


      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Contraseña',
            //quitamos línea inferior
            border: InputBorder.none,
            //agregamos espacio para que no esté pegado al borde
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }
  //widget círuclo superior login
  Widget _circleLogin(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor
      ),
    );
  }
  //widget imagen del banner login
  Widget _imgLogin(){
    return Container(
      margin: EdgeInsets.only(
          top: 70,
          bottom: MediaQuery.of(context).size.height * .22
      ),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }

  
}
