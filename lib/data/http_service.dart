import "dart:convert";
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:scamp_assessment/models/recipe_model.dart';

class HttpService {
  Future<RecipeList> getRecipes() async {
    final response = await http.get(Uri.parse(
        "https://d17h27t6h515a5.cloudfront.net/topher/2017/May/59121517_baking/baking.json"));

    if (response.statusCode == 200) {
      return RecipeList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
