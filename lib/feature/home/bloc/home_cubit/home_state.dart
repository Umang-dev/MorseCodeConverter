part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

class HomeConvertState extends HomeState {
  HomeConvertState({required this.convertedString});

  final String convertedString;
}

class HomeErrorState extends HomeState {
  HomeErrorState({required this.errorString});

  final String errorString;
}
