import 'package:easy_lib/locator.dart';
import 'package:easy_lib/res/common/app_colors.dart';
import 'package:easy_lib/res/common/list_tile.dart';
import 'package:easy_lib/src/features/home/bloc/User/user_bloc.dart';
import 'package:easy_lib/src/features/home/bloc/books/books_bloc.dart';
import 'package:easy_lib/src/features/home/repository/user_repository.dart';
import 'package:easy_lib/src/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:bloc/bloc.dart';
class Home extends StatefulWidget {
  const Home({super.key,required this.token});
  final String token ;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetUserEvent(token: widget.token));
    BlocProvider.of<BooksBloc>(context).add(GetAllBooks());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserLoaded){
              return  Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(state.user.name),
                ],
              );
            }
            else if(state is UserError){
              return  Text(state.err);
            }
            else {
              return const CircularProgressIndicator(
                color: AppColors.base,
                
              );
            }
          },
        ),
        actions: [
          IconButton(onPressed: ()async{
            final sp  = await SharedPreferences.getInstance();
            await sp.remove('x-auth-token');
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false) ;
          }, icon: Image.asset('assets/images/logout.png'))
        ],
        backgroundColor: AppColors.positive,
        foregroundColor: AppColors.black,
      ),
      body: RefreshIndicator(child: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state is BooksLoaded){
            final books = state.books ;
            return ListView.builder(itemCount: books.length,itemBuilder: (context,index){
              final book = books[index] ;
              return customListTile(book);
            });
          }
          else if (state is BooksError){
            return  Center(
              child: Text(state.err.toString())
            );
          }
          else{
            return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.black,
                  ),
                );
          }
        },
      ), onRefresh: ()async{
         BlocProvider.of<BooksBloc>(context).add(GetAllBooks());
      })
    );
  }
}
