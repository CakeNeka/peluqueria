import 'dart:convert';

class DiaFestivo {
  String? id;
  int day;
  int month;
  int year;
  String festiveName;

  DiaFestivo({
    this.id,
    required this.day,
    required this.month,
    required this.year,
    required this.festiveName,
  });

  factory DiaFestivo.fromRawJson(String str) =>
      DiaFestivo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiaFestivo.fromJson(Map<String, dynamic> json) => DiaFestivo(
        day: json["day"],
        month: json["month"],
        year: json["year"],
        festiveName: json["festiveName"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
        "festiveName": festiveName,
      };

  DiaFestivo copy() => DiaFestivo(
      id: id, day: day, month: month, year: year, festiveName: festiveName);
}
