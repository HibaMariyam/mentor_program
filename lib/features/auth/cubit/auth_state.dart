part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthLoaded extends AuthState {
  final String token;
  AuthLoaded(this.token);
}
final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
