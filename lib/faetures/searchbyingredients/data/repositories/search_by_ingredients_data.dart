import 'package:dartz/dartz.dart';
import 'package:recipe/faetures/searchbyingredients/data/datasources/recipe_remote_datsource.dart';
import 'package:recipe/faetures/searchbyingredients/data/exception/exceptions.dart';
import 'package:recipe/faetures/searchbyingredients/domain/entities/recipefromingredients_entities.dart';
import 'package:recipe/faetures/searchbyingredients/domain/failure/failure.dart';
import 'package:recipe/faetures/searchbyingredients/domain/repositories/searchbyingredients_repository.dart';

class RecipeRepoImpl implements RecipeRepo {
  final RecipeRemoteDataSource recipeRemoteDataSource =
      RecipeRemoteDataSourceImpl();
  @override
  Future<Either<Failure, List<RecipeEntitiy>>> getAdviceFromDataSource() async {
    try {
      final result = await recipeRemoteDataSource.getRecipe();

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (error) {
      return left(GeneralFailure());
    }
  }
}
