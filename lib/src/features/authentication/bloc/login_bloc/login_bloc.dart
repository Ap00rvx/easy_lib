import 'package:bloc/bloc.dart';
import 'package:easy_lib/locator.dart';
import 'package:easy_lib/res/utils/urls.dart';
import 'package:easy_lib/src/features/authentication/repository/authentication_rerpository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
  on<GetUserLoggedIn>((event, emit) async {
    final uid =event.uid;
    final password  = event.password;
    final bool remember  = event.remember ?? false ;

    final sp = await SharedPreferences.getInstance();
    emit(LoginLoadingState());
    try {
      final res = await locator.get<AuthenticationRepository>().login(uid, password);
      print(res['message']);
      print(remember);
      if(res['status'] == "success" && remember) {
        final saved = await sp.setString(
            'x-auth-token', res['token'].toString());
        print(saved);

      if(saved){
        emit(LogInSuccessState(token: res['token'].toString()));
      }
      }
      else if(res['status'] == "success" && !remember){
        emit(LogInSuccessState(token: res['token'].toString()));
      }
      else{
        emit(LoginErrorState(err: res['message'].toString()));
      }

    }catch (err){
      print(err);
    }
  });
  }
}
