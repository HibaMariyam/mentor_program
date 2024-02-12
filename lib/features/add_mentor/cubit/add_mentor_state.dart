part of 'add_mentor_cubit.dart';

sealed class AddMentorState {}

final class AddMentorInitial extends AddMentorState {}
final class AddMentorLoading extends AddMentorState {}
final class AddMentorLoaded extends AddMentorState {
  final Course course;
  AddMentorLoaded(this.course);
}
final class AddMentorFailure extends AddMentorState {
  final String message;
  AddMentorFailure(this.message);
}