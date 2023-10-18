import 'dart:convert';

import 'package:recipe/faetures/randomrecipes/data/models/random_recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipe/faetures/searchbyingredients/data/exception/exceptions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class RemoteRandomRecipe {
  Future<RandomRecipes> getRandomRecipe({required String mealType});
}

class RemoteRandomRecipeImpl implements RemoteRandomRecipe {
  final client = http.Client();
  final apiKey = dotenv.env['APIKEY'];
  @override
  Future<RandomRecipes> getRandomRecipe({required String mealType}) async {
    final response = await client.get(Uri.parse(
        'https://api.spoonacular.com/recipes/random?number=30&tags=$mealType&apiKey=$apiKey'));

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      var responseBody = json.decode(response.body);
      print(responseBody);
      return RandomRecipes.fromJson(responseBody);
    }
  }
}
