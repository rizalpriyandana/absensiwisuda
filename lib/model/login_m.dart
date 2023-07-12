import 'dart:convert';

class LoginModel {
  static String urlApi = "https://siakad.strada.ac.id/wisuda/login/do_log";
  static String username = 'username';
  static String password = 'password';
  static String idpetugas = 'id_petugas';
}


// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);



User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    bool error;
    String msg;
    Data data;

    User({
        required this.error,
        required this.msg,
        required this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        error: json["error"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    String idPetugas;
    String periode;
    String keterangan;

    Data({
        required this.idPetugas,
        required this.periode,
       required  this.keterangan,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        idPetugas: json["id_petugas"],
        periode: json["periode"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "id_petugas": idPetugas,
        "periode": periode,
        "keterangan": keterangan,
    };
}

