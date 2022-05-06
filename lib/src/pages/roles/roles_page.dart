import 'package:flutter/material.dart';


class RolesPage extends StatefulWidget {
  const RolesPage({Key key}) : super(key: key);

  @override
  _RolesPageState createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roles disponibles"),
      ),
      body: Center(
        child: Text("ROLES"),
      ),
    );
  }
}
