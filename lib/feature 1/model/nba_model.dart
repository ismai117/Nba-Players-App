import 'dart:convert';
import 'dart:ffi';

class NBAModel {
  int id;
  String firstName;
  String lastName;
  String team;
  String position;
  String dateOfBirth;
  String height;
  String weight;
  String jerseyNumber;
  String age;
  double careerPoints;
  double careerBlocks;
  double carrerAssists;
  double careerRebounds;
  double careerTurnovers;
  double careerPercentageThree;
  double careerPercentageFreethrow;
  double careerPercentageFieldGoal;
  String headShotUrl;
  String dateLastUpdated;

  NBAModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.team,
    required this.position,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.jerseyNumber,
    required this.age,
    required this.careerPoints,
    required this.careerBlocks,
    required this.carrerAssists,
    required this.careerRebounds,
    required this.careerTurnovers,
    required this.careerPercentageThree,
    required this.careerPercentageFreethrow,
    required this.careerPercentageFieldGoal,
    required this.headShotUrl,
    required this.dateLastUpdated,
  });

  factory NBAModel.fromJson(Map<String, dynamic> json) {
    return NBAModel(
      id: json["id"] ?? 0,
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      team: json["team"] ?? "",
      position: json["position"] ?? "",
      dateOfBirth: json["dateOfBirth"] ?? "",
      height: json["height"] ?? "",
      weight: json["weight"] ?? "",
      jerseyNumber: json["jerseyNumber"] ?? "",
      age: json["age"] ?? "",
      careerPoints: json["careerPoints"] ?? 00.00,
      careerBlocks: json["careerBlocks"] ?? 00.00,
      carrerAssists: json["carrerAssists"] ?? 00.00,
      careerRebounds: json["careerRebounds"] ?? 00.00,
      careerTurnovers: json["careerTurnovers"] ?? 00.00,
      careerPercentageThree: json["careerPercentageThree"] ?? 00.00,
      careerPercentageFreethrow: json["careerPercentageFreethrow"] ?? 00.00,
      careerPercentageFieldGoal: json["careerPercentageFieldGoal"] ?? 00.00,
      headShotUrl: json["headShotUrl"] ?? "",
      dateLastUpdated: json["dateLastUpdated"] ?? "",
    );
  }
}
