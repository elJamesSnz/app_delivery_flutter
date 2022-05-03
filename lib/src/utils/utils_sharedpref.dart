import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UtilsSharedpref{
  void save(String key, value) async{
    //obtener instancia de shared para usar métodos
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  //método para leer la información
  Future<dynamic> read(String key) async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString(key) == null) return null;
    return json.decode(prefs.getString(key));
  }

  //método para verificar si existe algún dato
  Future<bool> contains(String key) async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
  //método para eliminar datos de sahred preferences
  Future<bool> remove(String key) async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  void logout(BuildContext context) async{
    //borramos el key user para cerrar sesión
    await remove('user');
    //eliminar historial de pantallas
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
  }
}