// To parse this JSON data, do
//
//     final absensi = absensiFromJson(jsonString);

import 'dart:convert';

class AbsensiModel {
  static String idpetugas = 'id_petugas';
  static String jenis = 'jenis';
  static String kode = 'kode';
}

// To parse this JSON data, do
//
//     final absensi = absensiFromJson(jsonString);



Absensi absensiFromJson(String str) => Absensi.fromJson(json.decode(str));

String absensiToJson(Absensi data) => json.encode(data.toJson());

class Absensi {
    bool error;
    String msg;
    Data data;

    Absensi({
        required this.error,
        required this.msg,
        required this.data,
    });

    factory Absensi.fromJson(Map<String, dynamic> json) => Absensi(
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
    String nim;
    String name;
    String fakultas;
    String prodi;
    String jenjang;
    String namaOrtu;
    String photo;
    String statusOrtu;

    Data({
        required this.nim,
        required this.name,
        required this.fakultas,
        required this.prodi,
        required this.jenjang,
        required this.namaOrtu,
        required this.photo,
        required this.statusOrtu,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nim: json["nim"],
        name: json["name"],
        fakultas: json["fakultas"],
        prodi: json["prodi"],
        jenjang: json["jenjang"],
        namaOrtu: json["nama_ortu"],
        photo: json["photo"],
        statusOrtu: json["status_ortu"],
    );

    Map<String, dynamic> toJson() => {
        "nim": nim,
        "name": name,
        "fakultas": fakultas,
        "prodi": prodi,
        "jenjang": jenjang,
        "nama_ortu": namaOrtu,
        "photo": photo,
        "status_ortu": statusOrtu,
    };
}



SudahAbsensi sudahAbsensiFromJson(String str) => SudahAbsensi.fromJson(json.decode(str));

String sudahAbsensiToJson(SudahAbsensi data) => json.encode(data.toJson());

class SudahAbsensi {
    bool error;
    String msg;

    SudahAbsensi({
        required this.error,
        required this.msg,
    });

    factory SudahAbsensi.fromJson(Map<String, dynamic> json) => SudahAbsensi(
        error: json["error"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
    };
}

// To parse this JSON data, do
//
//     final statAbsensi = statAbsensiFromJson(jsonString);



StatAbsensi statAbsensiFromJson(String str) => StatAbsensi.fromJson(json.decode(str));

String statAbsensiToJson(StatAbsensi data) => json.encode(data.toJson());

class StatAbsensi {
    bool error;
    int total;
    List<Datum> data;

    StatAbsensi({
        required this.error,
        required this.total,
        required this.data,
    });

    factory StatAbsensi.fromJson(Map<String, dynamic> json) => StatAbsensi(
        error: json["error"],
        total: json["total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String totalAbsensi;
    String totalPeserta;
    String jenis;

    Datum({
        required this.totalAbsensi,
        required this.totalPeserta,
        required this.jenis,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        totalAbsensi: json["total_absensi"],
        totalPeserta: json["total_peserta"],
        jenis: json["jenis"],
    );

    Map<String, dynamic> toJson() => {
        "total_absensi": totalAbsensi,
        "total_peserta": totalPeserta,
        "jenis": jenis,
    };
}
