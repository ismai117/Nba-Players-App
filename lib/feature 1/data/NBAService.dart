import 'dart:convert';
import 'dart:io';

import '../model/nba_model.dart';
import 'package:http/http.dart' as http;

class NBAService {
  static Future<List<NBAModel>> getPlayers() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://nba-player-individual-stats.p.rapidapi.com/players'),
          headers: {
            'X-RapidAPI-Host': 'nba-player-individual-stats.p.rapidapi.com',
            'X-RapidAPI-Key':
                '8b37a3e6dfmsh2f8b716a9556bcap1c5851jsn4b3779666b3f',
            "useQueryString": "true"
          });

      if (response.statusCode == 200) {
        List listDecoded = jsonDecode(response.body);

        return listDecoded.map((e) => NBAModel.fromJson(e)).toList();

      } else {
        throw Exception("Unable to retrieve players list");
      }
    } on SocketException {
      throw Exception("Server error");
    } on HttpException {
      throw Exception("Something went wrong");
    } on FormatException {
      throw Exception("Bad request");
    } catch (e) {
      throw Exception(e);
    }
  }
}
