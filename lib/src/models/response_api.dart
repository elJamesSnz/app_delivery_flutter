import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {


  String message;
  String error;
  bool success;
  //dynamic para variable de cualquier tipo
  dynamic data;

  //Método constructor
  ResponseApi({
    this.message,
    this.error,
    this.success,
  });



  //sentencia factory que recibe mapa de valores JSON
  ResponseApi.fromJson(Map<String, dynamic> json){

    message = json["message"];
    error =  json["error"];
    success =  json["success"];
    try{
      data = json['data'];
    }catch(e){
      print('Exception data $e');
    }
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "success": success,
  };
}
