import 'package:recipe/faetures/searchbyingredients/domain/entities/recipefromingredients_entities.dart';
import 'package:recipe/faetures/searchbyingredients/domain/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeRepo {
  Future<Either<Failure, List<RecipeEntitiy>>> getAdviceFromDataSource(
      {required List<String> ingredients});
}
