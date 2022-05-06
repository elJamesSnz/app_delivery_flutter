import 'package:flutter/material.dart';

class CommerceOrdersListPage extends StatefulWidget {
  const CommerceOrdersListPage({Key key}) : super(key: key);

  @override
  _CommerceOrdersListPageState createState() => _CommerceOrdersListPageState();
}

class _CommerceOrdersListPageState extends State<CommerceOrdersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Commerce orders list page"),
      ),
    );
  }
}
