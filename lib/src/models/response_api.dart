import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {

  String message;
  String error;
  bool success;

  ResponseApi({
    required this.message,
    required this.error,
    required this.success,
  });



  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
    message: json["message"],
    error: json["error"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "success": success,
  };
}
