import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app_delivery_flutter/src/api/environment.dart';
import 'package:app_delivery_flutter/src/models/response_api.dart';
import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UsersProvider{
  //URL del api
  final String _url = Environment.API_DELIVERY;
  final String _api = '/api/users';

  BuildContext context;

  Future init(BuildContext context){
    this.context = context;
  }

  //respuesta de las solicitudes
  Future<ResponseApi> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {
        'Content-type': 'application/json'
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    }
    catch(e) {
      print('Error: $e');
      return null;
    }
  }

  //respuesta de las solicitudes
  Future<ResponseApi> login(String email, String pw) async {
    try {

      //URL para el post
      Uri url = Uri.http(_url, '$_api/login');
      //Parámetros a enviar en cuerpo de datos
      String bodyParams = json.encode({
        'email': email,
        'password': pw,
      });

      //Aplicación JSON
      Map<String, String> headers = {
        'Content-type': 'application/json'
      };

      //Petición POST de login
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    }
    catch(e) {
      print('Error: $e');
      return null;
    }
  }
}