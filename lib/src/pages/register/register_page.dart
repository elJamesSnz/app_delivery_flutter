
import 'package:app_delivery_flutter/src/pages/register/register_controller.dart';
import 'package:app_delivery_flutter/src/utils/utils_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //se recupera el controlador
  RegisterController _con = new RegisterController();

  //Controlador se inicializa en initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //bind del contexto
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        _con.init(context);
    });
  }

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
                child: _circleRegister()
            ),
            Positioned(
              child: _txtRegister(),
              top: 65,
              left: 28,
            ),
            Positioned(
              child: _iconBack(),
              top: 51,
              left: -5,
            ),
            Container(
              //para centrar
              width: double.infinity,
              //se agrega margin hacia arriba
              margin: EdgeInsets.only(top: 150),
              //Para hacer scroll en la pantalla
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imgUser(),
                    SizedBox(height: 30),
                    _txtFEmail(),
                    _txtFName(),
                    _txtFLastName(),
                    _txtFPhone(),
                    _txtFPW(),
                    _txtFConfirmPW(),
                    _btnRegister()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //método para retornar imagen
  Widget _imgUser(){
    return CircleAvatar(
      //recuperar imagen
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      //establecer radio imagen
      radius: 60,
      //establecer color de fondo
      backgroundColor: UtilsColors.primaryBackgroundColor,
    );
  }

//método para retornar el ícono de back
  Widget _iconBack(){
    return IconButton(
      //método al presionar
        onPressed: _con.back,
        //se recupera ícono
        icon: Icon(Icons.arrow_back_ios, color: Colors.white)
    );
  }

//Widget texto register
  Widget _txtRegister(){
    //se retorna un texto
    return Text(
        'Registro',
        //agregar estilos al texto
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'NimbusSans'
        )
    );
  }

//widget botón Register
  Widget _btnRegister(){
    //para alargar un componente widget puede agruparse en un container
    return Container(
      //margen de la pantalla
      width: double.infinity,
      //agregar margen en los espacios horizontales y entre componentes
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _con.register,
        child: Text('Registrarse'),
        //estilos al botón
        style: ElevatedButton.styleFrom(
          //cambiar color al botón
            primary: UtilsColors.primaryColor,
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
        color: UtilsColors.primaryOpacityColor,
        //radio del box
        borderRadius: BorderRadius.circular(30),


      ),
      child: TextField(
        //Controlador de email
        controller: _con.emailCtrller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo electrónico',
            //quitamos línea inferior
            border: InputBorder.none,
            //agregamos espacio para que no esté pegado al borde
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: UtilsColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.email,
              color: UtilsColors.primaryColor,
            )
        ),
      ),
    );
  }

//widget campo name
  Widget _txtFName(){
    return Container(
      //márgenes a los espacios horizontales
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      //agregar decoraciones al container como color, forma, etc
      decoration: BoxDecoration(
        //color del box
        color: UtilsColors.primaryOpacityColor,
        //radio del box
        borderRadius: BorderRadius.circular(30),


      ),
      child: TextField(
        //Controlador de name
        controller: _con.nameCtrller,
        decoration: InputDecoration(
            hintText: 'Nombre',
            //quitamos línea inferior
            border: InputBorder.none,
            //agregamos espacio para que no esté pegado al borde
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: UtilsColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.person,
              color: UtilsColors.primaryColor,
            )
        ),
      ),
    );
  }

//widget campo apellido
  Widget _txtFLastName(){
    return Container(
      //márgenes a los espacios horizontales
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      //agregar decoraciones al container como color, forma, etc
      decoration: BoxDecoration(
        //color del box
        color: UtilsColors.primaryOpacityColor,
        //radio del box
        borderRadius: BorderRadius.circular(30),


      ),
      child: TextField(
        //Controlador de lastname
        controller: _con.lastnameCtrller,
        decoration: InputDecoration(
            hintText: 'Apellido',
            //quitamos línea inferior
            border: InputBorder.none,
            //agregamos espacio para que no esté pegado al borde
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: UtilsColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.person_outline,
              color: UtilsColors.primaryColor,
            )
        ),
      ),
    );
  }

//widget campo phone
  Widget _txtFPhone(){
    return Container(
      //márgenes a los espacios horizontales
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      //agregar decoraciones al container como color, forma, etc
      decoration: BoxDecoration(
        //color del box
        color: UtilsColors.primaryOpacityColor,
        //radio del box
        borderRadius: BorderRadius.circular(30),


      ),
      child: TextField(
        //Controlador de phone
        controller: _con.phoneCtrller,
        //cambiar tipo de teclado a puro texto
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Teléfono',
            //quitamos línea inferior
            border: InputBorder.none,
            //agregamos espacio para que no esté pegado al borde
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: UtilsColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.phone,
              color: UtilsColors.primaryColor,
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
        color: UtilsColors.primaryOpacityColor,
        //radio del box
        borderRadius: BorderRadius.circular(30),


      ),
      child: TextField(
        //controlador pw
        controller: _con.pwCtrller,
        //ocultar texto de pw
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            //quitamos línea inferior
            border: InputBorder.none,
            //agregamos espacio para que no esté pegado al borde
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: UtilsColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: UtilsColors.primaryColor,
            )
        ),
      ),
    );
  }

//widget campo password
  Widget _txtFConfirmPW(){
    return Container(
      //márgenes a los espacios horizontales
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      //agregar decoraciones al container como color, forma, etc
      decoration: BoxDecoration(
        //color del box
        color: UtilsColors.primaryOpacityColor,
        //radio del box
        borderRadius: BorderRadius.circular(30),


      ),
      child: TextField(
        //controlador pw
        controller: _con.confirmpwCtrller,
        //ocultar texto de pw
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirmar contraseña',
            //quitamos línea inferior
            border: InputBorder.none,
            //agregamos espacio para que no esté pegado al borde
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: UtilsColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: UtilsColors.primaryColor,
            )
        ),
      ),
    );
  }

//widget círuclo superior Register
  Widget _circleRegister(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: UtilsColors.primaryColor
      ),
    );
  }
}

