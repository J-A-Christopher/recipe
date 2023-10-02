part of 'searchbyingredients_bloc.dart';

abstract class SearchbyingredientsState extends Equatable {
  const SearchbyingredientsState();

  @override
  List<Object> get props => [];
}

class SearchbyingredientsInitial extends SearchbyingredientsState {}

class SearchbyingredientsLoading extends SearchbyingredientsState {}

class SearchbyingredientsLoaded extends SearchbyingredientsState {}

class SearchbyingredientsError extends SearchbyingredientsState {
  final String message;
  const SearchbyingredientsError({required this.message});
}
