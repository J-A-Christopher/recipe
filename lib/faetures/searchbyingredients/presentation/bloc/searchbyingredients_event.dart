part of 'searchbyingredients_bloc.dart';

@immutable
abstract class RecipeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecipeRequestedEvent extends RecipeEvent {
  List<String> ingredients;
  RecipeRequestedEvent({required this.ingredients});
  @override
  List<Object?> get props => [ingredients];
}
