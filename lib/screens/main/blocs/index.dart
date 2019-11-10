import 'dart:async';
import 'package:bloc/bloc.dart';

class MainScreenEvent {}

class LoadingEvent extends MainScreenEvent {}

class MainScreenState {}

class LoadingState extends MainScreenState {}

class LoadedState extends MainScreenState {}

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenState get initialState => new LoadingState();
  String address;
  @override
  Stream<MainScreenState> mapEventToState(
    MainScreenEvent event,
  ) async* {
    if (event is LoadingEvent) {
      yield LoadedState();
    }
  }
}
