
import 'package:easy_lib/src/features/authentication/repository/authentication_rerpository.dart';
import 'package:easy_lib/src/features/home/repository/books_repository.dart';
import 'package:easy_lib/src/features/home/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I ;

void setUp() {
  print("setting up");
  locator.registerSingleton<AuthenticationRepository>(AuthenticationRepository());
  locator.registerSingleton<UserRepository>(UserRepository());
  locator.registerSingleton<BooksRepository>(BooksRepository());
}