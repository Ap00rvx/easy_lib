import 'package:bloc/bloc.dart';
import 'package:easy_lib/locator.dart';
import 'package:easy_lib/src/features/home/repository/user_repository.dart';
import 'package:easy_lib/src/model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      final token = event.token ;
      emit(UserLoading());
      try {
        final user =  await locator.get<UserRepository>().getProfile(token);
        if(user != null){
          emit(UserLoaded(user: user));
        }
        else{
          emit(UserError(err: "Unable to get user details"));
        }
      }catch (err){
        emit(UserError(err: err.toString()));
      }
    });
  }
}
