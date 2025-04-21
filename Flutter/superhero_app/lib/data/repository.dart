import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superhero_app/data/models/superhero_response.dart';

class Repository {
  Future<SuperheroResponse?> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse(
        'https://superheroapi.com/api/7fe3f5329e31fc9b126bd1c67396b3ff/search/$name',
      ),
    );

    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      SuperheroResponse superheroResponse = SuperheroResponse.fromJson(
        decodedJson,
      );

      return superheroResponse;
    } else {
      return null;
    }
  }
}
