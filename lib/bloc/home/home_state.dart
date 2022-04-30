part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  final List<dynamic> lists;
  HomeInitial({required this.lists});
}

class HomeUnitial extends HomeState {}

class OnLoadingHomeInitial extends HomeState {}

class SearchInitial extends HomeState {}


class HomeNoDataInitial extends HomeState {}

class HomeErrorInitial extends HomeState {
  final String message;
  HomeErrorInitial(this.message);
}