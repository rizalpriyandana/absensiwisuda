// To parse this JSON data, do
//
//     final tipePerserta = tipePersertaFromJson(jsonString);

import 'dart:convert';

TipePerserta tipePersertaFromJson(String str) => TipePerserta.fromJson(json.decode(str));

String tipePersertaToJson(TipePerserta data) => json.encode(data.toJson());

class TipePerserta {
    bool error;
    int total;
    List<Datum> data;

    TipePerserta({
        required this.error,
        required this.total,
        required this.data,
    });

    factory TipePerserta.fromJson(Map<String, dynamic> json) => TipePerserta(
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
    String id;
    String label;

    Datum({
        required this.id,
        required this.label,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
    };
}
