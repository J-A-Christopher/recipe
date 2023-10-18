import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'localstorage_event.dart';
part 'localstorage_state.dart';

class LocalstorageBloc extends Bloc<LocalstorageEvent, LocalstorageState> {
  LocalstorageBloc() : super(LocalstorageInitial()) {
    on<SaveRecipe>((event, emit) async {
      emit(LocalstorageLoading());
      await Future.delayed(const Duration(seconds: 3), () {});
      emit(LocalstorageSaved());
    });
  }
}
