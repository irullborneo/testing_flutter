part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetDefaultData extends HomeEvent {}

class FilterData extends HomeEvent {
  final String value;
  FilterData(this.value);
}

class ClearFilterData extends HomeEvent {}

class SetSearchView extends HomeEvent{}