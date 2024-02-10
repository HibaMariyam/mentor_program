part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Course> courses;
  HomeLoaded(this.courses);
}
final class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
