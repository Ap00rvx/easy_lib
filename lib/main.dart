import 'package:easy_lib/locator.dart';
import 'package:easy_lib/res/common/app_colors.dart';
import 'package:easy_lib/src/features/authentication/bloc/login_bloc/login_bloc.dart';
import 'package:easy_lib/src/features/home/bloc/User/user_bloc.dart';
import 'package:easy_lib/src/features/home/bloc/books/books_bloc.dart';
import 'package:easy_lib/src/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => BooksBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        theme: ThemeData(
        fontFamily: 'default',
          primarySwatch: buildMaterialColor(Color(0xFF011627)),
          scaffoldBackgroundColor: AppColors.base
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
