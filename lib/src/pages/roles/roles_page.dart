import 'package:app_delivery_flutter/src/models/rol.dart';
import 'package:app_delivery_flutter/src/pages/roles/roles_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class RolesPage extends StatefulWidget {
  const RolesPage({Key key}) : super(key: key);

  @override
  _RolesPageState createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  //se instancia controlador
  RolesController _con = new RolesController();

  //se sobreescribe initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //instancia init con contexto y se le manda la función de refresh
      _con.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roles disponibles"),
      ),
      body: Container(
        //se agrega margen en el top
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .14),
        child: ListView(
          //En caso de que el valor de roles de usuario no sea nulo, se mapea en una lista.
          children: _con.user != null ? _con.user.roles.map((Rol rol) {
            return _cardRol(rol);
          }).toList() : [],
        ),
      ),
    );
  }
  
  

  Widget _cardRol(Rol rol){
    return GestureDetector(
      //como se recibe parámetro se establece así
      onTap: () {
        _con.goToPage(rol.route);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            child: FadeInImage(
              image: rol.image !=null
                  ? NetworkImage(rol.image)
                  : AssetImage('assets/img/no-image.png'),
              //para que se acomode mejor la imagen
              fit: BoxFit.contain,
              //duración efecto de fade in
              fadeInDuration: Duration(milliseconds: 50),
              //placeholder para asegurar que si image es null, se ponga img de Assets
              placeholder: AssetImage('assets/img/no-image.png'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            //si viene nulo y además no es vacío
            rol.name ?? '',
            //estilos al texto
            style: TextStyle(
              fontSize: 16,
              color: Colors.black
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  void refresh(){
    setState(() {

    });
  }
}
