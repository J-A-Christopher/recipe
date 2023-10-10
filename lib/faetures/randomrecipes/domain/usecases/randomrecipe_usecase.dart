import 'package:dartz/dartz.dart';
import 'package:recipe/faetures/randomrecipes/data/repositories/random_recipe_repo_impl.dart';
import 'package:recipe/faetures/randomrecipes/domain/entities/random_recipe_ent.dart';
import 'package:recipe/faetures/searchbyingredients/domain/failure/failure.dart';

class RandomUsecase {
  Future<Either<Failure, RandomRecipeEnt>> getRandomRecipe(
      {required String mealType}) async {
    final randomUseCases = RandomRepoImpl();
    final result = await randomUseCases.getRandomRecipe(mealType: mealType);
    return result;
    //return left(GeneralFailure());
  }
}
