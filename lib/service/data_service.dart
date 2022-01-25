import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_ticket/configs/constant.dart';
import 'package:movie_ticket/model/data_model.dart';

//https://api.themoviedb.org/3/movie/popular?api_key=cce5a481f8d29ff58e07afcd44e7681f&language=en-US
class DataServices {
  String baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = baseUrl + Constants.apiKey + "&language=en-US";
    http.Response res = await http.get(Uri.parse(apiUrl));
    try {
      if (res.statusCode == 200) {
        // print(res.body);
        List<dynamic> list = json.decode(res.body)["results"] ;
         return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
