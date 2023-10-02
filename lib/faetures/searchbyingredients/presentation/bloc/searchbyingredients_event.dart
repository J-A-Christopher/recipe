part of 'searchbyingredients_bloc.dart';

abstract class SearchbyingredientsEvent extends Equatable {
  const SearchbyingredientsEvent();

  @override
  List<Object> get props => [];
}

class GetRecipeFromIngredients extends SearchbyingredientsEvent {}
