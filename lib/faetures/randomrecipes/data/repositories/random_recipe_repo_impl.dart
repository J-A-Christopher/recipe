import 'package:dartz/dartz.dart';
import 'package:recipe/faetures/randomrecipes/data/datasources/random_recipe_datasource.dart';
import 'package:recipe/faetures/randomrecipes/domain/entities/random_recipe_ent.dart';
import 'package:recipe/faetures/randomrecipes/domain/repositories/random_repo.dart';
import 'package:recipe/faetures/searchbyingredients/data/exception/exceptions.dart';
import 'package:recipe/faetures/searchbyingredients/domain/failure/failure.dart';

class RandomRepoImpl implements RandomRepo {
  final RemoteRandomRecipe remoteRandomRecipe = RemoteRandomRecipeImpl();
  @override
  Future<Either<Failure, RandomRecipeEnt>> getRandomRecipe(
      {required String mealType}) async {
    try {
      final dataSource =
          await remoteRandomRecipe.getRandomRecipe(mealType: mealType);
      return right(dataSource);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (error) {
      return left(GeneralFailure());
    }
  }
}
