part of 'localstorage_bloc.dart';

class LocalstorageState extends Equatable {
  const LocalstorageState();

  @override
  List<Object> get props => [];
}

class LocalstorageInitial extends LocalstorageState {}

class LocalstorageLoading extends LocalstorageState {}

class LocalstorageLoaded extends LocalstorageState {}

class LocalstorageSaved extends LocalstorageState {}

class LocalstorageError extends LocalstorageState {}
