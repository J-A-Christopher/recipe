import 'package:recipe/faetures/randomrecipes/domain/entities/random_recipe_ent.dart';
import 'package:recipe/faetures/searchbyingredients/domain/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class RandomRepo {
  Future<Either<Failure, RandomRecipeEnt>> getRandomRecipe(
      {required String mealType});
}
