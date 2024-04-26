part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoading extends UserState{}
class UserLoaded extends UserState{
  final User user ;

  UserLoaded({required this.user});
}
class UserError extends UserState{
  final String err;

  UserError({required this.err});
}