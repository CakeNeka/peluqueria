import 'dart:convert';

class Dia {
  String? id;
  int startTimeMorningHour;
  int startTimeMorningMinute;
  int endTimeMorningHour;
  int endTimeMorningMinute;
  int startTimeEveningHour;
  int startTimeEveningMinute;
  int endTimeEveningHour;
  int endTimeEveningMinute;
  bool lateShift;

  Dia({
    this.id,
    required this.startTimeMorningHour,
    required this.startTimeMorningMinute,
    required this.endTimeMorningHour,
    required this.endTimeMorningMinute,
    required this.startTimeEveningHour,
    required this.startTimeEveningMinute,
    required this.endTimeEveningHour,
    required this.endTimeEveningMinute,
    required this.lateShift,
  });

  factory Dia.fromRawJson(String str) => Dia.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dia.fromJson(Map<String, dynamic> json) => Dia(
        startTimeMorningHour: json["startTimeMorningHour"],
        startTimeMorningMinute: json["startTimeMorningMinute"],
        endTimeMorningHour: json["endTimeMorningHour"],
        endTimeMorningMinute: json["endTimeMorningMinute"],
        startTimeEveningHour: json["startTimeEveningHour"],
        startTimeEveningMinute: json["startTimeEveningMinute"],
        endTimeEveningHour: json["endTimeEveningHour"],
        endTimeEveningMinute: json["endTimeEveningMinute"],
        lateShift: json["lateShift"],
      );

  Map<String, dynamic> toJson() => {
        "startTimeMorningHour": startTimeMorningHour,
        "startTimeMorningMinute": startTimeMorningMinute,
        "endTimeMorningHour": endTimeMorningHour,
        "endTimeMorningMinute": endTimeMorningMinute,
        "startTimeEveningHour": startTimeEveningHour,
        "startTimeEveningMinute": startTimeEveningMinute,
        "endTimeEveningHour": endTimeEveningHour,
        "endTimeEveningMinute": endTimeEveningMinute,
        "lateShift": lateShift,
      };

  Dia copy() => Dia(
      id: id,
      startTimeEveningHour: startTimeEveningHour,
      startTimeEveningMinute: startTimeEveningMinute,
      startTimeMorningHour: startTimeMorningHour,
      startTimeMorningMinute: startTimeMorningMinute,
      endTimeEveningHour: endTimeEveningHour,
      endTimeEveningMinute: endTimeEveningMinute,
      endTimeMorningHour: endTimeMorningHour,
      endTimeMorningMinute: endTimeMorningMinute,
      lateShift: lateShift);
}
