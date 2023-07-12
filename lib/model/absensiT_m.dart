// To parse this JSON data, do
//
//     final absensiTamu = absensiTamuFromJson(jsonString);

import 'dart:convert';

AbsensiTamu absensiTamuFromJson(String str) => AbsensiTamu.fromJson(json.decode(str));

String absensiTamuToJson(AbsensiTamu data) => json.encode(data.toJson());

class AbsensiTamu {
    bool error;
    String msg;
    Data data;

    AbsensiTamu({
        required this.error,
        required this.msg,
        required this.data,
    });

    factory AbsensiTamu.fromJson(Map<String, dynamic> json) => AbsensiTamu(
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
    String namaPeserta;
    String status;

    Data({
        required this.namaPeserta,
        required this.status,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        namaPeserta: json["nama_peserta"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "nama_peserta": namaPeserta,
        "status": status,
    };
}
