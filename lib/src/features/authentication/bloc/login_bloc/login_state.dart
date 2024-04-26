part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogInSuccessState extends LoginState {
  final String token ;
  LogInSuccessState({required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginErrorState extends LoginState {
  final String err;

  LoginErrorState({required this.err});
  @override
  // TODO: implement props
  List<Object?> get props => [err];

}