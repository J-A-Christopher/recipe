part of 'searchbyingredients_bloc.dart';

@immutable
abstract class RecipeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<RecipeEntitiy> recipe;
  RecipeLoaded({required this.recipe});

  @override
  List<Object?> get props => [recipe];
}

class RecipeError extends RecipeState {
  final String message;
  RecipeError({required this.message});

  @override
  List<Object?> get props => [message];
}
