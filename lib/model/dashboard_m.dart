import 'dart:convert';


class StatAbsensiModel {
  static String idpetugas = 'id_petugas';
}
class GetProdiiModel {
  static String idpetugas = 'id_petugas';
}

// To parse this JSON data, do
//
//     final prodi = prodiFromJson(jsonString);



Prodi prodiFromJson(String str) => Prodi.fromJson(json.decode(str));

String prodiToJson(Prodi data) => json.encode(data.toJson());

class Prodi {
    bool error;
    int total;
    List<Datum> data;

    Prodi({
        required this.error,
        required this.total,
        required this.data,
    });

    factory Prodi.fromJson(Map<String, dynamic> json) => Prodi(
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
    String jenjang;
    String prodi;
    String totalTerdaftar;
    String totalHadir;

    Datum({
        required this.jenjang,
        required this.prodi,
        required this.totalTerdaftar,
        required this.totalHadir,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jenjang: json["jenjang"],
        prodi: json["prodi"],
        totalTerdaftar: json["total_terdaftar"],
        totalHadir: json["total_hadir"],
    );

    Map<String, dynamic> toJson() => {
        "jenjang": jenjang,
        "prodi": prodi,
        "total_terdaftar": totalTerdaftar,
        "total_hadir": totalHadir,
    };
}

// To parse this JSON data, do
//
//     final jenjang = jenjangFromJson(jsonString);



Jenjang jenjangFromJson(String str) => Jenjang.fromJson(json.decode(str));

String jenjangToJson(Jenjang data) => json.encode(data.toJson());

class Jenjang {
    bool error;
    int total;
    List<Datumku> data;

    Jenjang({
        required this.error,
        required this.total,
        required this.data,
    });

    factory Jenjang.fromJson(Map<String, dynamic> json) => Jenjang(
        error: json["error"],
        total: json["total"],
        data: List<Datumku>.from(json["data"].map((x) => Datumku.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datumku {
    String jenjang;
    String totalWisuda;

    Datumku({
        required this.jenjang,
        required this.totalWisuda,
    });

    factory Datumku.fromJson(Map<String, dynamic> json) => Datumku(
        jenjang: json["jenjang"],
        totalWisuda: json["total_wisuda"],
    );

    Map<String, dynamic> toJson() => {
        "jenjang": jenjang,
        "total_wisuda": totalWisuda,
    };
}
