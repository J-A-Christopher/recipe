import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe/faetures/searchbyingredients/data/models/recipefromingredients_model.dart';
import 'package:recipe/faetures/searchbyingredients/domain/entities/recipefromingredients_entities.dart';
import 'package:recipe/faetures/searchbyingredients/domain/failure/failure.dart';
import 'package:recipe/faetures/searchbyingredients/domain/usecases/searchbyingredusecases.dart';

part 'searchbyingredients_event.dart';
part 'searchbyingredients_state.dart';

const serverFailure = 'Server failure try again later';
const generalFailure = 'Something went wrong. Are you online?';
const defaultMessage = 'Oops something went wrong.';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    final RecipeUseCases recipeUseCases = RecipeUseCases();
    on<RecipeRequestedEvent>((event, emit) async {
      emit(RecipeLoading());
      final failureOrRecipe = await recipeUseCases.getRecipe();
      failureOrRecipe.fold(
          (failure) =>
              emit(RecipeError(message: _mapFailureToMessage(failure))),
          (recipe) => emit(RecipeLoaded(recipe: recipe)));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailure;
      case GeneralFailure:
        return generalFailure;
      default:
        return defaultMessage;
    }
  }
}
