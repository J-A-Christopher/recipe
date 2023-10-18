import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe/common/.constants/constants.dart';

import 'package:recipe/faetures/searchbyingredients/data/exception/exceptions.dart';
import 'package:recipe/faetures/searchbyingredients/data/models/recipefromingredients_model.dart';
import 'package:http/http.dart' as http;

abstract class RecipeRemoteDataSource {
  Future<List<IngredientRecipe>> getRecipe({required List<String> ingredients});
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final client = http.Client();
  final apiKey = dotenv.env['APIKEY'];
  //final key = Secret.API_KEY;
  @override
  Future<List<IngredientRecipe>> getRecipe(
      {required List<String> ingredients}) async {
    final response = await client.get(Uri.parse(
        'https://api.spoonacular.com/recipes/findByIngredients?ingredients=${ingredients[0]}, +${ingredients[1]}, +${ingredients[2]}&number=30&apiKey=$apiKey'));
    print(response.statusCode);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      var responseBody = json.decode(response.body);

      List<IngredientRecipe> ingredientRecipes = [];

      for (var ingredient in responseBody) {
        var ingredientObject = IngredientRecipe.fromJson(ingredient);
        ingredientRecipes.add(ingredientObject);
      }

      return ingredientRecipes;
    }
  }
}
