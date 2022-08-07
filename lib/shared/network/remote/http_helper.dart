import 'dart:convert';

import 'package:flutter_application_20/models/home_model/home_model.dart';
import 'package:flutter_application_20/models/searsh_model/searsh_model.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  Future<List<Hits>?> getApi() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://pixabay.com/api/?key=25244427-c1bee2c19d0d9d299acf72132&image_type=photo&page=5'));
      HomeModel homeModel = new HomeModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return homeModel.hits;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<Photos>?> getDataSearsh(String query) async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://api.pexels.com/v1/search?query=$query'));
      searsh seaerch = new searsh.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return seaerch.photos;
      }
    } catch (e) {
      print(e);
    }
  }
}
