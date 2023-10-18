import 'package:recipe/faetures/searchbyingredients/data/repositories/search_by_ingredients_data.dart';
import 'package:recipe/faetures/searchbyingredients/domain/entities/recipefromingredients_entities.dart';
import 'package:recipe/faetures/searchbyingredients/domain/failure/failure.dart';
import 'package:recipe/faetures/searchbyingredients/domain/repositories/searchbyingredients_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeUseCases {
  final recipeRepo = RecipeRepoImpl();
  Future<Either<Failure, List<RecipeEntitiy>>> getRecipe(
      {required List<String> ingredients}) async {
    return recipeRepo.getAdviceFromDataSource(ingredients: ingredients);
  }
}
