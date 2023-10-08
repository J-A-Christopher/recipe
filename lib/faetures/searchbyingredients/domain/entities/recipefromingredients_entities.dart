import 'package:equatable/equatable.dart';
import 'package:recipe/faetures/searchbyingredients/data/models/recipefromingredients_model.dart';

class RecipeEntitiy extends Equatable {
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? usedIngredientCount;
  int? missedIngredientCount;
  List<MissedIngredients>? missedIngredients;
  List<UsedIngredients>? usedIngredients;
  List<UnusedIngredients>? unusedIngredients;
  int? likes;

  RecipeEntitiy(
      {this.id,
      this.title,
      this.image,
      this.imageType,
      this.usedIngredientCount,
      this.missedIngredientCount,
      this.missedIngredients,
      this.usedIngredients,
      this.unusedIngredients,
      this.likes});

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        imageType,
        usedIngredientCount,
        missedIngredientCount,
        missedIngredients,
        usedIngredients,
        unusedIngredients,
        likes
      ];
  // final String recipe;
  // final int id;
  // const RecipeEntitiy({required this.id, required this.recipe});

  // @override
  // List<Object?> get props => [recipe, id];
}
