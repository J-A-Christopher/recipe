import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searchbyingredients_event.dart';
part 'searchbyingredients_state.dart';

class SearchbyingredientsBloc extends Bloc<SearchbyingredientsEvent, SearchbyingredientsState> {
  SearchbyingredientsBloc() : super(SearchbyingredientsInitial()) {
    on<SearchbyingredientsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
