part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class GetUserLoggedIn extends LoginEvent{
  final String uid ;
  final String password  ;
  final bool remember ;

  GetUserLoggedIn( {required this.uid, required this.password, required this.remember,});
}